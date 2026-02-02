import 'package:flutter/widgets.dart';
import 'package:testcase_1/core/query/client/query_client.dart';
import 'package:testcase_1/core/query/client/query_client_provider.dart';
import 'package:testcase_1/core/query/endpoints/mutation_endpoint.dart';
import 'package:testcase_1/core/query/endpoints/custom_mutation_endpoint.dart';
import 'package:testcase_1/core/query/states/mutation_state.dart';

/// Typedef untuk mutate function
typedef MutateFunction<TParams, TBody> =
    Future<void> Function({TParams? params, TBody? body});

/// Widget builder untuk consume mutation
///
/// Features:
/// - Provides mutate function
/// - Provides reset function
/// - Handle loading/error/success states
/// - Auto invalidates tags on success
///
/// Example:
/// ```dart
/// MutationBuilder<Post, void, CreatePostBody>(
///   endpoint: PostApiService.createPost,
///   onSuccess: (data) => Navigator.pop(context),
///   builder: (context, state, mutate, reset) {
///     return ElevatedButton(
///       onPressed: state.isLoading ? null : () => mutate(body: body),
///       child: state.isLoading ? CircularProgressIndicator() : Text('Create'),
///     );
///   },
/// )
/// ```
class MutationBuilder<TData, TParams, TBody> extends StatefulWidget {
  /// Mutation endpoint
  final MutationEndpoint<TData, TParams, TBody>? endpoint;

  /// Custom mutation endpoint (alternative)
  final CustomMutationEndpoint<TData, TParams, TBody>? customEndpoint;

  /// Builder function
  final Widget Function(
    BuildContext context,
    MutationState<TData> state,
    MutateFunction<TParams, TBody> mutate,
    VoidCallback reset,
  )
  builder;

  /// Callback on success
  final void Function(TData data)? onSuccess;

  /// Callback on error
  final void Function(String error)? onError;

  /// Callback on settled (success or error)
  final VoidCallback? onSettled;

  const MutationBuilder({
    super.key,
    this.endpoint,
    this.customEndpoint,
    required this.builder,
    this.onSuccess,
    this.onError,
    this.onSettled,
  }) : assert(
         endpoint != null || customEndpoint != null,
         'Either endpoint or customEndpoint must be provided',
       );

  /// Factory constructor for simple mutations without params
  static MutationBuilder<TData, void, TBody> simple<TData, TBody>({
    Key? key,
    MutationEndpoint<TData, void, TBody>? endpoint,
    CustomMutationEndpoint<TData, void, TBody>? customEndpoint,
    required Widget Function(
      BuildContext context,
      MutationState<TData> state,
      Future<void> Function({TBody? body}) mutate,
      VoidCallback reset,
    )
    builder,
    void Function(TData data)? onSuccess,
    void Function(String error)? onError,
    VoidCallback? onSettled,
  }) {
    return MutationBuilder<TData, void, TBody>(
      key: key,
      endpoint: endpoint,
      customEndpoint: customEndpoint,
      builder: (context, state, mutate, reset) {
        return builder(
          context,
          state,
          ({TBody? body}) => mutate(body: body),
          reset,
        );
      },
      onSuccess: onSuccess,
      onError: onError,
      onSettled: onSettled,
    );
  }

  @override
  State<MutationBuilder<TData, TParams, TBody>> createState() =>
      _MutationBuilderState<TData, TParams, TBody>();
}

class _MutationBuilderState<TData, TParams, TBody>
    extends State<MutationBuilder<TData, TParams, TBody>> {
  late QueryClient _client;
  MutationState<TData> _state = const MutationState();

  @override
  void initState() {
    super.initState();
    _client = QueryClientProvider.read(context);
  }

  Future<void> _mutate({TParams? params, TBody? body}) async {
    if (_state.isLoading) return;

    setState(() => _state = MutationState<TData>.loading());

    MutationState<TData> result;

    if (widget.endpoint != null) {
      result = await _client.mutate(
        widget.endpoint!,
        params: params,
        body: body,
      );
    } else {
      result = await _client.mutateCustom(
        widget.customEndpoint!,
        params: params,
        body: body,
      );
    }

    if (mounted) {
      setState(() => _state = result);

      // Callbacks
      if (result.isSuccess && result.data != null) {
        widget.onSuccess?.call(result.data as TData);
      }
      if (result.isError && result.errorMessage != null) {
        widget.onError?.call(result.errorMessage!);
      }
      widget.onSettled?.call();
    }
  }

  void _reset() {
    setState(() => _state = const MutationState());
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _state, _mutate, _reset);
  }
}

import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// AppSearchField - Consistent search field widget
///
/// Usage:
/// ```dart
/// AppSearchField(
///   onChanged: (value) => search(value),
///   hintText: 'Search products...',
/// )
///
/// AppSearchField(
///   controller: searchController,
///   onSubmitted: (value) => performSearch(value),
///   onClear: () => clearSearch(),
/// )
/// ```
class AppSearchField extends StatefulWidget {
  const AppSearchField({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.autofocus = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.showClearButton = true,
    this.borderRadius,
    this.backgroundColor,
    this.contentPadding,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final bool autofocus;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool showClearButton;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final EdgeInsets? contentPadding;

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  late TextEditingController _controller;
  bool _showClear = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _showClear = _controller.text.isNotEmpty;
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onTextChanged() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _showClear) {
      setState(() => _showClear = hasText);
    }
  }

  void _handleClear() {
    _controller.clear();
    widget.onClear?.call();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final effectiveBorderRadius = widget.borderRadius ?? AppRadius.borderInput;

    return TextField(
      controller: _controller,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      textInputAction: TextInputAction.search,
      style: AppTypography.input.copyWith(color: colors.textPrimary),
      decoration: InputDecoration(
        hintText: widget.hintText ?? 'Search...',
        hintStyle: AppTypography.input.copyWith(color: colors.textSecondary),
        filled: true,
        fillColor: widget.backgroundColor ?? colors.surfaceAlt,
        contentPadding: widget.contentPadding ?? AppSpacing.inputPadding,
        prefixIcon:
            widget.prefixIcon ??
            Icon(
              Icons.search_rounded,
              color: colors.textSecondary,
              size: AppSizes.iconMd,
            ),
        suffixIcon:
            widget.suffixIcon ??
            (widget.showClearButton && _showClear
                ? IconButton(
                    onPressed: _handleClear,
                    icon: Icon(
                      Icons.close_rounded,
                      color: colors.textSecondary,
                      size: AppSizes.iconMd,
                    ),
                  )
                : null),
        border: OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
      ),
    );
  }
}

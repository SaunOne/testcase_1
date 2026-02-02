/// Query System - RTK Query-like data fetching solution untuk Flutter
///
/// Features:
/// - Zero boilerplate: Define endpoint sekali, pakai di mana saja
/// - Built-in caching: Automatic caching dengan TTL dan tag-based invalidation
/// - Type-safe: Full type safety untuk params, body, dan response
/// - RTK Query DX: Developer experience mirip RTK Query (React)
library query;

// Client
export 'client/query_client.dart';
export 'client/query_client_provider.dart';

// Endpoints
export 'endpoints/base_endpoint.dart';
export 'endpoints/query_endpoint.dart';
export 'endpoints/custom_query_endpoint.dart';
export 'endpoints/mutation_endpoint.dart';
export 'endpoints/custom_mutation_endpoint.dart';

// States
export 'states/query_state.dart';
export 'states/mutation_state.dart';

// Builders
export 'builders/query_builder.dart';
export 'builders/mutation_builder.dart';

// Options
export 'options/query_options.dart';

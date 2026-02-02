import 'dart:collection';

class CacheKeyBuilder {
  const CacheKeyBuilder._();

  static String build({
    required String method,
    required String path,
    Map<String, dynamic>? queryParams,
  }) {
    final sortedQuery = _sortAndEncodeQuery(queryParams);
    return '$method:$path${sortedQuery.isNotEmpty ? '?$sortedQuery' : ''}';
  }

  static String _sortAndEncodeQuery(Map<String, dynamic>? params) {
    if (params == null || params.isEmpty) return '';

    final sorted = SplayTreeMap<String, dynamic>.from(params);
    return sorted.entries
        .map(
          (e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value.toString())}',
        )
        .join('&');
  }
}

import 'package:testcase_1/core/network/cache/cache_key_builder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CacheKeyBuilder', () {
    test('buildKey should generate consistent keys', () {
      final key1 = CacheKeyBuilder.build(
        method: 'GET',
        path: '/users',
        queryParams: {'page': '1'},
      );

      final key2 = CacheKeyBuilder.build(
        method: 'GET',
        path: '/users',
        queryParams: {'page': '1'},
      );

      expect(key1, equals(key2));
    });

    test('buildKey should generate different keys for different params', () {
      final key1 = CacheKeyBuilder.build(
        method: 'GET',
        path: '/users',
        queryParams: {'page': '1'},
      );

      final key2 = CacheKeyBuilder.build(
        method: 'GET',
        path: '/users',
        queryParams: {'page': '2'},
      );

      expect(key1, isNot(equals(key2)));
    });

    test('buildKey should generate different keys for different methods', () {
      final key1 = CacheKeyBuilder.build(method: 'GET', path: '/users');

      final key2 = CacheKeyBuilder.build(method: 'POST', path: '/users');

      expect(key1, isNot(equals(key2)));
    });

    test('buildKey should handle null queryParams', () {
      final key = CacheKeyBuilder.build(method: 'GET', path: '/users');

      expect(key, isNotEmpty);
    });
  });
}

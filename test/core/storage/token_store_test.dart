import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:testcase_1/core/storage/token_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  group('TokenStore', () {
    late TokenStore tokenStore;
    late MockFlutterSecureStorage mockStorage;

    setUp(() {
      mockStorage = MockFlutterSecureStorage();
      tokenStore = TokenStore(storage: mockStorage);
    });

    test('getAccessToken should return token from storage', () async {
      when(
        () => mockStorage.read(key: 'access_token'),
      ).thenAnswer((_) async => 'test_token');

      final token = await tokenStore.getAccessToken();

      expect(token, equals('test_token'));
      verify(() => mockStorage.read(key: 'access_token')).called(1);
    });

    test('getRefreshToken should return token from storage', () async {
      when(
        () => mockStorage.read(key: 'refresh_token'),
      ).thenAnswer((_) async => 'test_refresh_token');

      final token = await tokenStore.getRefreshToken();

      expect(token, equals('test_refresh_token'));
      verify(() => mockStorage.read(key: 'refresh_token')).called(1);
    });

    test('saveTokens should store both tokens', () async {
      when(
        () => mockStorage.write(
          key: any(named: 'key'),
          value: any(named: 'value'),
        ),
      ).thenAnswer((_) async {});

      await tokenStore.saveTokens(
        accessToken: 'access',
        refreshToken: 'refresh',
      );

      verify(
        () => mockStorage.write(key: 'access_token', value: 'access'),
      ).called(1);
      verify(
        () => mockStorage.write(key: 'refresh_token', value: 'refresh'),
      ).called(1);
    });

    test('clearTokens should delete both tokens', () async {
      when(
        () => mockStorage.delete(key: any(named: 'key')),
      ).thenAnswer((_) async {});

      await tokenStore.clearTokens();

      verify(() => mockStorage.delete(key: 'access_token')).called(1);
      verify(() => mockStorage.delete(key: 'refresh_token')).called(1);
    });

    test('hasTokens should return true when access token exists', () async {
      when(
        () => mockStorage.read(key: 'access_token'),
      ).thenAnswer((_) async => 'token');

      final hasTokens = await tokenStore.hasTokens();

      expect(hasTokens, isTrue);
    });

    test('hasTokens should return false when no access token', () async {
      when(
        () => mockStorage.read(key: 'access_token'),
      ).thenAnswer((_) async => null);

      final hasTokens = await tokenStore.hasTokens();

      expect(hasTokens, isFalse);
    });
  });
}

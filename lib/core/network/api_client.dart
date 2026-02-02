import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:testcase_1/core/network/cache/cache_policy.dart';
import 'package:testcase_1/core/network/dio_client.dart';
import 'package:testcase_1/core/network/error/dio_error_mapper.dart';
import 'package:testcase_1/core/network/error/failure.dart';
import 'package:testcase_1/core/result/result.dart';

class ApiClient {
  final DioClient _dioClient;

  ApiClient({required DioClient dioClient}) : _dioClient = dioClient;

  Future<Result<T>> get<T>({
    required String path,
    required T Function(dynamic json) fromJson,
    Map<String, dynamic>? queryParameters,
    CachePolicy? cachePolicy,
  }) async {
    try {
      debugPrint('🔵 ApiClient.get START => path: $path');
      final response = await _dioClient.get<dynamic>(
        path,
        queryParameters: queryParameters,
        cachePolicy: cachePolicy,
      );
      debugPrint('🟢 ApiClient.get SUCCESS => status: ${response.statusCode}');
      return Result.success(fromJson(response.data));
    } on DioException catch (e) {
      debugPrint(
        '🔴 ApiClient.get DioException => ${e.type}, message: ${e.message}',
      );
      return Result.failure(DioErrorMapper.map(e));
    } catch (e) {
      debugPrint('🔴 ApiClient.get Exception => $e');
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }

  Future<Result<T>> post<T>({
    required String path,
    required T Function(dynamic json) fromJson,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      debugPrint('🔵 ApiClient.post START => path: $path, data: $data');
      final response = await _dioClient.post<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      debugPrint('🟢 ApiClient.post SUCCESS => status: ${response.statusCode}');
      return Result.success(fromJson(response.data));
    } on DioException catch (e) {
      debugPrint(
        '🔴 ApiClient.post DioException => ${e.type}, message: ${e.message}',
      );
      return Result.failure(DioErrorMapper.map(e));
    } catch (e) {
      debugPrint('🔴 ApiClient.post Exception => $e');
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }

  Future<Result<T>> put<T>({
    required String path,
    required T Function(dynamic json) fromJson,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dioClient.put<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return Result.success(fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(DioErrorMapper.map(e));
    } catch (e) {
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }

  Future<Result<void>> delete({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      await _dioClient.delete<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return const Result.success(null);
    } on DioException catch (e) {
      return Result.failure(DioErrorMapper.map(e));
    } catch (e) {
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }
}

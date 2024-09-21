import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:my_prayers/core/constants/my_strings.dart';

class DioConfig {
  DioConfig._();
  static DioConfig instance = DioConfig._();
  Dio getDio() {
    final cacheOptions = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.request,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 7),
      priority: CachePriority.normal,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );
    Duration timeOut = const Duration(seconds: 5);
    BaseOptions options = BaseOptions(
      baseUrl: MyStrings.baseUrl,
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
    );
    return Dio(options)
      ..interceptors.addAll(
        [
          LogInterceptor(
            request: true,
            error: true,
            responseBody: true,
          ),
          DioCacheInterceptor(options: cacheOptions)
        ],
      );
  }
}

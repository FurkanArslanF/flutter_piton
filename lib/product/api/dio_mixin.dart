import 'package:dio/dio.dart';

mixin DioServiceMixin {
  final dio = Dio(BaseOptions(baseUrl: 'https://assign-api.piton.com.tr/api/rest/'));
}

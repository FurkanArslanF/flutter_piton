import 'dart:io';
import 'package:flutter_piton/product/api/dio_mixin.dart';
import 'package:flutter_piton/product/entities/image.dart';

abstract class IImageService {
  Future<String> imageUrl({required String imgPath});
}

class ImageApiService extends IImageService with DioServiceMixin {
  ImageApiService._();
  static final instance = ImageApiService._();
  static const apiHttps = 'cover_image';

  late String _url;

  @override
  Future<String> imageUrl({required String imgPath}) async {
    try {
      final response = await dio.post(
        apiHttps,
        data: {
          "fileName": imgPath,
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          _url = ImageModel.fromJson(data).actionProductImage?.url ?? "";
        }
        return _url;
      }
      return _url;
    } catch (e) {
      rethrow;
    }
  }
}

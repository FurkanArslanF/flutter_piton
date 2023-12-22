// ignore: unused_import
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_piton/product/api/image.dart';

class ImageCubit extends Cubit<String> {
  ImageCubit() : super("");

  fetchImageUrl(String imgPath) async {
    try {
      final url = await ImageApiService.instance.imageUrl(imgPath: imgPath);
      emit(url);
    } catch (e) {
      rethrow;
    }
  }
}

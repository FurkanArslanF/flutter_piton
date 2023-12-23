import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_piton/product/cubit/image_cubit.dart';
import 'package:sizer/sizer.dart';

class AppImage extends StatelessWidget {
  const AppImage({super.key, required this.imgPath, this.width = 20});
  final String imgPath;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ImageCubit()..fetchImageUrl(imgPath),
      lazy: false,
      child: AppImageBuilder(imgWidth: width),
    );
  }
}

class AppImageBuilder extends StatelessWidget {
  const AppImageBuilder({super.key, required this.imgWidth});
  final double imgWidth;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, String>(
      builder: (context, state) {
        return Container(
          height: 65.w,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          //color: Colors.amber,
          child: CachedNetworkImage(
            //fit: BoxFit.cover,
            imageUrl: state,
            //placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Center(child: CircularProgressIndicator()),
            width: imgWidth.w,
          ),
        );
      },
    );
  }
}

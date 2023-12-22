import 'package:flutter/material.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _controller.value = 1.0;
    _controller.reverse();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 1.0, end: 0.7).animate(_controller),
      child: CircleAvatar(
        backgroundColor: AppConstants.widgetBg,
        child: IconButton(
          highlightColor: Colors.transparent,
          onPressed: () {
            setState(() {
              isLiked = !isLiked;
              if (isLiked) {
                _controller.forward().then((_) {
                  _controller.reverse();
                });
              }
            });
          },
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: AppConstants.textButtonColor,
          ),
        ),
      ),
    );
  }
}

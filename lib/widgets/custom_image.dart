import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import '../utils/constant/api_constant.dart';
import 'shimmer_effect.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    this.borderRadius = BorderRadius.zero,
  });

  final String image;
  final double width, height;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        width: width,
        height: height,
        fit: BoxFit.fill,
        filterQuality: FilterQuality.high,
        imageUrl: ApiConstant.imageUrl + image,
        placeholder: (context, url) => ShimmerEffect(
          height: height,
        ),
        errorWidget: (context, url, error) => Container(
          width: width,
          height: height,
          color: Colors.white10,
          child: const Center(
              child: Icon(
            Icons.error,
            size: 30,
            color: Colors.red,
          )),
        ),
      ),
    );
  }
}

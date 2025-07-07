import 'package:flutter/material.dart';

import '../utils/constant/images.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.alternativeImage,
      fit: BoxFit.fill,
    );
  }
}

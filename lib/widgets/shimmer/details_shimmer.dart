import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shimmer_effect.dart';
import 'genre_shimmer.dart';
import 'horizontal_shimmer.dart';


class DetailsShimmer extends StatelessWidget {
  const DetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerEffect(width: size.width, height: 450),
          const SizedBox(height: 12),
          const SizedBox(height: 40, child: GenreShimmer()),
          const SizedBox(height: 12),
          ShimmerEffect(width: size.width * 0.5, height: 20),
          const SizedBox(height: 12),
          ShimmerEffect(width: size.width * 0.45, height: 20),
          const SizedBox(height: 12),
          ShimmerEffect(width: size.width * 0.5, height: 20),
          const SizedBox(height: 12),
          ShimmerEffect(width: size.width * 0.8, height: 30),
          const SizedBox(height: 12),
          ShimmerEffect(width: size.width, height: 20),
          const SizedBox(height: 12),
          ShimmerEffect(width: size.width, height: 20),
          const SizedBox(height: 12),
          ShimmerEffect(width: size.width, height: 20),
          const SizedBox(height: 12),
          ShimmerEffect(width: size.width * 0.2, height: 25),
          const SizedBox(height: 12),
          const SizedBox(height: 300, child: HorizontalShimmer()),
        ],
      ),
    );
  }
}

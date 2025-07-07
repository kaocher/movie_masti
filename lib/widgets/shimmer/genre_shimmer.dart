import 'package:flutter/material.dart';

import '../custom_list.dart';
import '../shimmer_effect.dart';

class GenreShimmer extends StatelessWidget {
  const GenreShimmer({
    super.key,
    this.itemCount = 6,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return CustomList(
      itemCount: itemCount,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, __) => const ShimmerEffect(width: 90, height: 45),
    );
  }
}
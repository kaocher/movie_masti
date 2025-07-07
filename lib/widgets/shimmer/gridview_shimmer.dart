import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_grid.dart';
import '../shimmer_effect.dart';

class GridViewShimmer extends StatelessWidget {
  const GridViewShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return CustomGrid(
      itemCount: itemCount,
      itemBuilder: (_, __) => SizedBox(
        height: 310,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: ShimmerEffect(width: size.width, height: 225)),
            const SizedBox(height: 8),
            ShimmerEffect(width: size.width, height: 20),
            const SizedBox(height: 8),
            ShimmerEffect(width: size.width, height: 20),
            const SizedBox(height: 8),
            ShimmerEffect(width: size.width, height: 20),
          ],
        ),
      ),
    );
  }
}

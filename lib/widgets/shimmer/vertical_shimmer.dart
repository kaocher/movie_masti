import 'package:flutter/material.dart';

import '../custom_list.dart';
import '../shimmer_effect.dart';

class VerticalShimmer extends StatelessWidget {
  const VerticalShimmer({
    super.key,
    this.itemCount = 6,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return CustomList(
      itemCount: itemCount,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      isHorizontalList: false,
      itemBuilder: (_, __) => SizedBox(
        width: size.width,
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShimmerEffect(width: 120, height: 150),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ShimmerEffect(width: size.width, height: 20),
                  ShimmerEffect(width: size.width, height: 20),
                  ShimmerEffect(width: size.width, height: 20),
                  ShimmerEffect(width: size.width, height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

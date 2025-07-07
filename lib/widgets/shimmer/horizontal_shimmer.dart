import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_list.dart';
import '../shimmer_effect.dart';

class HorizontalShimmer extends StatelessWidget {
  const HorizontalShimmer({
    super.key,
    this.itemCount = 5,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return CustomList(
      itemCount: itemCount,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, __) => const SizedBox(
        width: 170,
        height: 310,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: ShimmerEffect(width: 170, height: 225)),
            SizedBox(height: 6),
            ShimmerEffect(width: 170, height: 20),
            SizedBox(height: 6),
            ShimmerEffect(width: 170, height: 20),
            SizedBox(height: 6),
            ShimmerEffect(width: 170, height: 20),
          ],
        ),
      ),
    );
  }
}

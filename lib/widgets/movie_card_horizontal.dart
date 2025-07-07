import 'package:flutter/material.dart';

import 'custom_image.dart';


class MovieCardHorizontal extends StatelessWidget {
  const MovieCardHorizontal(
      {super.key,
      required this.image,
      required this.title,
      required this.overView,
      required this.voteAvarage,
      required this.onTap});
  final String image;
  final String title;
  final String overView;
  final double voteAvarage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 150,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Color(0xff36454F),
        ),
        child: Row(
          children: [
            // Thumbnail Image
            SizedBox(
              width: 120,
              height: 150,
              child: Stack(
                children: [
                  CustomImage(
                    image: image,
                    width: 120,
                    height: 150,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        '⭐${voteAvarage.toStringAsFixed(1)}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 4),

            // Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        overView,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

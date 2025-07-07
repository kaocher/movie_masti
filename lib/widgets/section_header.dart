import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.text,
     this.onTap,
    this.isButtonVisible = true,
  });
  final String text;
  final bool isButtonVisible;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          isButtonVisible
              ? TextButton(
                  onPressed: onTap,
                  child:  Text(
                    'See All',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white54),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

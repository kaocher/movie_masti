import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  const CustomList({
    super.key,
    required this.itemCount,
    this.physics = const BouncingScrollPhysics(),
    this.shrinkWrap = true,
    this.padding = EdgeInsets.zero,
    this.scrollDirection = Axis.horizontal,
    required this.itemBuilder,
    this.controller,
    this.isHorizontalList = true,
  });

  final int itemCount;
  final ScrollPhysics physics;
  final ScrollController? controller;
  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;
  final Axis scrollDirection;
  final bool isHorizontalList;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      controller: controller,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: padding,
      scrollDirection: scrollDirection,
      itemBuilder: itemBuilder,
      separatorBuilder: (BuildContext context, int index) => isHorizontalList
          ? const SizedBox(width: 12)
          : const SizedBox(height: 12),
    );
  }
}

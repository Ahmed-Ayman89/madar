import 'package:flutter/material.dart';
import 'package:madar/core/helper/app_colors.dart';

class CustomDotIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const CustomDotIndicator({
    super.key,
    required this.currentIndex,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(right: 8),
          height: 8,
          width: currentIndex == index ? 24 : 8,
          decoration: BoxDecoration(
            color: currentIndex == index ? AppColors.primary500 : AppColors.n300,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

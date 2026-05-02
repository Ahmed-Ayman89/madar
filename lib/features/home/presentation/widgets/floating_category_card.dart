import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';

class FloatingCategoryCard extends StatelessWidget {
  const FloatingCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            offset: const Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildItem(
            context,
            iconPath: 'assets/icon/innovative 1.png',
            label: 'ابتكار',
          ),
          _buildItem(
            context,
            iconPath: 'assets/icon/diagram 1.png',
            label: 'حلول',
          ),
          _buildItem(
            context,
            iconPath: 'assets/icon/settings 1.png',
            label: 'عناية',
          ),
          _buildItem(
            context,
            iconPath: 'assets/icon/book 1.png',
            label: 'تطوير',
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context,
      {required String iconPath, required String label}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          iconPath,
          width: 28.r,
          height: 28.r,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 6.h),
        Text(
          label,
          style: AppTextStyle.setStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.bgBlue900,
          ),
        ),
      ],
    );
  }
}

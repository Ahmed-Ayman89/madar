import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';

class FilterDropdownWidget extends StatelessWidget {
  final String text;

  const FilterDropdownWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 109.w,
      height: 36.h,
      padding: EdgeInsets.only(
        top: 6.h,
        bottom: 6.h,
        right: 8.w,
        left: 8.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFFD9D7DB), width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              text,
              style: AppTextStyle.setStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: 16.sp,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';

class MoreGridItemWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onTap;

  const MoreGridItemWidget({
    super.key,
    required this.title,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 163.5.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xFFF3F4F6), width: 0.8.w),
          boxShadow: [
            BoxShadow(
              color: const Color(0x1A000000),
              offset: const Offset(0, 2),
              blurRadius: 4.r,
              spreadRadius: -2.r,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Light blue icon placeholder
              Center(
                child: Image.asset(imagePath, width: 40.w, height: 40.w),
              ),
              SizedBox(width: 8.w),

              Expanded(
                child: Text(
                  title,
                  style: AppTextStyle.setStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

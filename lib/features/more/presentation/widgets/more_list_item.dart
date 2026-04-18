import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';

class MoreListItemWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final String? imagePath;
  final Widget? trailingWidget;
  final VoidCallback? onTap;

  const MoreListItemWidget({
    super.key,
    required this.title,
    this.icon,
    this.imagePath,
    this.trailingWidget,
    this.onTap,
  }) : assert(icon != null || imagePath != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        width: 311.w,
        height: 52.h,
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0x1A000000),
              offset: const Offset(0, 1),
              blurRadius: 4.r,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Row(
            children: [
              // Leading Icon
              Center(
                child: imagePath != null
                    ? Image.asset(imagePath!, width: 36.w, height: 36.w)
                    : Icon(icon, color: Colors.black54, size: 20.sp),
              ),
              SizedBox(width: 12.w),
              // Title text
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyle.setStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              // Trailing widget (arrow or custom)
              trailingWidget ??
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14.sp,
                    color: Colors.black54,
                  ),
              SizedBox(width: 4.w),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';

class TechFieldCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget icon;

  const TechFieldCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // The user specified 168x130. We'll let the Grid handle it but keep it in mind for aspect ratio.
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFFD9D9D9), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 26.w,
            height: 26.h,
            padding: EdgeInsets.all(5.w),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: Color(0xFF1B2B55), // Dark navy from previous theme
            ),
            child: Center(child: icon),
          ),
          SizedBox(height: 10.h),
          Text(
            title,
            style: AppTextStyle.setStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Text(
            description,
            style: AppTextStyle.setStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ).copyWith(height: 1.4),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

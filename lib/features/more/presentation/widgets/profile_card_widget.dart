import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 90.h,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar (Right in RTL)
          Container(
            width: 60.r,
            height: 60.r,
            decoration: BoxDecoration(
              color: const Color(0xFFFFD180), // Yellow/Orange
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Text(
                'م',
                style: AppTextStyle.setStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          // Info
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'محمود عبد الجواد',
                style: AppTextStyle.setStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF182D62),
                ),
              ),
              Text(
                'mahmoud2@gmail.com',
                style: AppTextStyle.setStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.n400,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Edit Icon (Left in RTL)
          Icon(Icons.edit_note_outlined, color: const Color(0xFF182D62), size: 32.r),
        ],
      ),
    );
  }
}

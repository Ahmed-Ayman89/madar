import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';

class TeamCardWidget extends StatelessWidget {
  final String name;
  final String title;
  final String imagePath;

  const TeamCardWidget({
    super.key,
    required this.name,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163.w,
      height: 229.h,
      decoration: BoxDecoration(
        color: const Color(0x1F5B7ED7),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14979797),
            offset: Offset(0, 10),
            blurRadius: 80,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Middle divider line
          Positioned(
            top: 130.h,
            left: 0,
            right: 0,
            child: Container(
              height: 1,
              color: Colors.white.withValues(alpha: 0.1),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                name,
                style: AppTextStyle.setWhite(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4.h),
              Text(
                title,
                style: AppTextStyle.setWhite(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ).copyWith(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              // Avatar
              Container(
                width: 76.r,
                height: 76.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3.w),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Spacer(),
              // Bottom Logo
              Image.asset(
                'assets/photo/madar_header.png',
                height: 14.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ],
      ),
    );
  }
}

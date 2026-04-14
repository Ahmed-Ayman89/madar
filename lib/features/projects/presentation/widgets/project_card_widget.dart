import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';

class ProjectCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String? logoPath;

  const ProjectCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 347.w,
      height: 445.h,
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFD9D9D9), width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0x2E000000),
            offset: const Offset(0, 2),
            blurRadius: 12.r,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 220.h,
              fit: BoxFit.cover,
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo (if available)
                  if (logoPath != null) ...[
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Image.asset(
                        logoPath!,
                        height: 30.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 8.h),
                  ],

                  // Project Title
                  Text(
                    title,
                    style: AppTextStyle.setStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 12.h),

                  // Project Description
                  Text(
                    description,
                    style: AppTextStyle.setStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.6),
                    ).copyWith(height: 1.5),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const Spacer(),

                  // Learn More Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'learn_more'.tr(context),
                        style: AppTextStyle.setStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF259CCB),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12.sp,
                        color: const Color(0xFF259CCB),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

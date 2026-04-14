import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'our_work_header.dart';
import 'work_project_card.dart';

class OurWorkSection extends StatelessWidget {
  const OurWorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          const OurWorkHeader(),
          SizedBox(height: 24.h),
          const WorkProjectCard(),
          SizedBox(height: 30.h),
          // Show All Button
          Center(
            child: SizedBox(
              width: 120.w,
              height: 33.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF259CCB),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(68.r),
                  ),
                  elevation: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'show_all'.tr(context),
                      style: AppTextStyle.setStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Directionality.of(context) == TextDirection.rtl
                          ? Icons.arrow_forward_ios
                          : Icons.arrow_back_ios,
                      size: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

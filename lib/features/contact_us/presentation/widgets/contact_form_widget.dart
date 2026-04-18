import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'custom_text_field.dart';

class ContactFormWidget extends StatelessWidget {
  const ContactFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2E5B), // Dark blue form background
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 44.h,
            child: CustomTextField(hintText: 'form_full_name'.tr(context)),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 44.h,
                  child: CustomTextField(hintText: 'form_phone'.tr(context)),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: SizedBox(
                  height: 44.h,
                  child: CustomTextField(hintText: 'form_email'.tr(context)),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 44.h,
                  child: CustomTextField(
                    hintText: 'form_project_type'.tr(context),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: SizedBox(
                  height: 44.h,
                  child: CustomTextField(
                    hintText: 'form_company_name'.tr(context),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 120.h,
            child: CustomTextField(
              hintText: 'form_message'.tr(context),
              maxLines: 5,
            ),
          ),
          SizedBox(height: 30.h),
          SizedBox(
            width: 157.w,
            height: 46.h,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icon/sent.svg',
                width: 36.w,
                height: 36.h,
              ),
              label: Text(
                'form_submit'.tr(context),
                style: AppTextStyle.setWhite(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                maximumSize: Size(157.w, 44.h),
                backgroundColor: const Color(0xFF259CCB),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(96.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

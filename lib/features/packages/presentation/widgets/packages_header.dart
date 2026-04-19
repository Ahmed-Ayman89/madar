import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/widgets/custom_header_widget.dart';
import 'package:madar/core/widgets/CustomElevatedButton_widget.dart';

class PackagesHeader extends StatelessWidget {
  const PackagesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHeaderWidget(
      title: 'packages_header_category'.tr(context),
      titleStyle: AppTextStyle.setStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF259CCB),
      ),
      subtitle: 'packages_header_title'.tr(context),
      subtitleStyle: AppTextStyle.setWhite(
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
      content: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'packages_header_desc'.tr(context),
              style: AppTextStyle.setWhite(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ).copyWith(
                color: Colors.white.withOpacity(0.85),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30.h),
          CustomElevatedButton(
            onPressed: () {},
            text: 'packages_header_btn'.tr(context),
          ),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }
}

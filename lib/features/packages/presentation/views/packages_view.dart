import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/widgets/custom_header_widget.dart';
import 'package:madar/core/widgets/CustomElevatedButton_widget.dart';

import '../widgets/package_card_widget.dart';

class PackagesView extends StatelessWidget {
  const PackagesView({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine RTL

    final List<String> packageFeatures = [
      'pkg_feature_1'.tr(context),
      'pkg_feature_2'.tr(context),
      'pkg_feature_3'.tr(context),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            CustomHeaderWidget(
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
                      style:
                          AppTextStyle.setWhite(
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
                    // backgroundColor: const Color(0xFF259CCB),
                    // textColor: Colors.white,
                    // width: 200.w,
                    // height: 48.h,
                    // isStroked: false,
                  ),
                  SizedBox(height: 60.h),
                ],
              ),
            ),

            // Packages Content Section
            SizedBox(height: 20.h),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    'packages_section_title'.tr(context),
                    style: AppTextStyle.setStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Text(
                    'packages_section_subtitle'.tr(context),
                    style: AppTextStyle.setStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ).copyWith(height: 1.6),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40.h),

                // Cards List
                PackageCardWidget(
                  title: 'pkg_basic_title'.tr(context),
                  subtitle: 'pkg_basic_subtitle'.tr(context),
                  price: '7000',
                  features: packageFeatures,
                  icon: Icons.bolt,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PackageCardWidget(
                    title: 'pkg_social_title'.tr(context),
                    subtitle: 'pkg_social_subtitle'.tr(context),
                    price: '7000',
                    features: packageFeatures,
                    icon: Icons.star_border,
                    iconColor: const Color(0xFFF59E0B), // Orange star
                    isHighlighted: true,
                    badgeText: 'pkg_social_badge'.tr(context),
                  ),
                ),

                PackageCardWidget(
                  title: 'pkg_pro_title'.tr(context),
                  subtitle: 'pkg_pro_subtitle'.tr(context),
                  price: '7000',
                  features: packageFeatures,
                  icon: Icons.rocket_launch_outlined,
                  iconColor: Colors.green, // Green rocket
                ),
              ],
            ),
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
}

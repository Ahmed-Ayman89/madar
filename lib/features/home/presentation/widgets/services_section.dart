import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'services_header.dart';
import 'service_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Modular Header
          const ServicesHeader(),

          SizedBox(height: 24.h),

          // Grid of Services
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
            childAspectRatio: 166 / 156,
            children: [
              ServiceCard(
                title: 'web_design'.tr(context),
                iconPath: 'assets/icon/work.svg',
                gradientColors: const [Color(0xFF5A7899), Color(0xFF3A5E83)],
              ),
              ServiceCard(
                title: 'mobile_apps'.tr(context),
                iconPath: 'assets/icon/notification.svg',
                gradientColors: const [Color(0xFFB9D7E6), Color(0xFF65A8C8)],
              ),
              ServiceCard(
                title: 'social_marketing'.tr(context),
                iconPath: 'assets/icon/building.svg',
                gradientColors: const [Color(0xFFE0E7EF), Color(0xFF9DAFC4)],
              ),
              ServiceCard(
                title: 'systems_dashboards'.tr(context),
                iconPath: 'assets/icon/home.svg',
                gradientColors: const [Color(0xFF3B91B9), Color(0xFF19688F)],
              ),
              ServiceCard(
                title: 'seo_optimization'.tr(context),
                iconPath: 'assets/icon/service.svg',
                gradientColors: const [Color(0xFF5A7899), Color(0xFF203549)],
              ),
              ServiceCard(
                title: 'visual_identity'.tr(context),
                iconPath: 'assets/icon/work.svg',
                gradientColors: const [Color(0xFFBFCBDA), Color(0xFF5A7899)],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';

class AboutUsStatsRow extends StatelessWidget {
  const AboutUsStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _StatItem(value: '5+', label: 'stat_experience'.tr(context)),
          const _VerticalDivider(),
          _StatItem(value: '120+', label: 'stat_happy_clients'.tr(context)),
          const _VerticalDivider(),
          _StatItem(value: '50+', label: 'stat_successful_projects'.tr(context)),
          const _VerticalDivider(),
          _StatItem(value: '95%', label: 'stat_customer_satisfaction'.tr(context)),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyle.setStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0E1A39),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: AppTextStyle.setStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColors.n300,
          ),
        ),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 1,
      color: Colors.blue.withValues(alpha: 0.1),
    );
  }
}

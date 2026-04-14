import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';

class PackageCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final List<String> features;
  final IconData icon;
  final Color iconColor;
  final bool isHighlighted;
  final String? badgeText;

  const PackageCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.features,
    required this.icon,
    this.iconColor = const Color(0xFF14244B),
    this.isHighlighted = false,
    this.badgeText,
  });

  @override
  Widget build(BuildContext context) {
    if (isHighlighted) {
      // Draw highlighted version with badge
      return Container(
        margin: EdgeInsets.only(bottom: 24.h),
        decoration: BoxDecoration(
          color: const Color(0xFFEBF7FB), // Light blue background for badge
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Badge Area
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Text(
                badgeText ?? '',
                key: const ValueKey('badgeText'),
                style: AppTextStyle.setStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF259CCB),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // The actual card
            _buildMainCard(context),
          ],
        ),
      );
    }

    // Normal unhighlighted card
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: _buildMainCard(context),
    );
  }

  Widget _buildMainCard(BuildContext context) {
    return Container(
      width: 347.w,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          if (isHighlighted)
            BoxShadow(
              color: const Color(0x1A000000),
              offset: const Offset(0, 4),
              blurRadius: 12.r,
            )
          else
            BoxShadow(
              color: const Color(0x0A000000),
              offset: const Offset(0, 2),
              blurRadius: 8.r,
            ),
        ],
        // border: isHighlighted ? null : Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row (Icon + Title)
          Row(
            children: [
              Icon(icon, color: iconColor, size: 24.sp),
              SizedBox(width: 8.w),
              Text(
                title,
                style: AppTextStyle.setStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF14244B),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),

          // Subtitle
          Text(
            subtitle,
            style: AppTextStyle.setStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 16.h),

          // Divider
          Divider(color: Colors.grey.shade300, thickness: 1),
          SizedBox(height: 16.h),

          // Includes Title
          Text(
            'pkg_includes'.tr(context),
            style: AppTextStyle.setStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF14244B),
            ),
          ),
          SizedBox(height: 12.h),

          // Features List
          ...features.map(
            (feature) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 16.sp,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      feature,
                      style: AppTextStyle.setStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Price Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                price,
                style: AppTextStyle.setStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
                textDirection: TextDirection.ltr,
              ),
              SizedBox(width: 4.w),
              Text(
                'pkg_currency'.tr(context),
                style: AppTextStyle.setStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                '/${'pkg_monthly'.tr(context)}',
                style: AppTextStyle.setStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),

          // Button
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(87.r),
            child: Container(
              width: 319.w, // almost full card width
              height: 48.h,
              decoration: BoxDecoration(
                color: isHighlighted ? const Color(0xFF259CCB) : Colors.white,
                borderRadius: BorderRadius.circular(87.r),
                border: isHighlighted
                    ? null
                    : Border.all(color: const Color(0xFFC4C8DA), width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    // Try to simulate Whatsapp or a chat icon
                    Icons.chat_outlined,
                    color: isHighlighted ? Colors.white : Colors.green,
                    size: 18.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'pkg_contact_btn'.tr(context),
                    style: AppTextStyle.setStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: isHighlighted ? Colors.white : Colors.black,
                    ),
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

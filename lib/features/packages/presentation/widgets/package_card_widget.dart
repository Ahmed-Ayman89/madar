import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/features/packages/domain/entities/package_entity.dart';

class PackageCardWidget extends StatelessWidget {
  final PackageEntity package;
  final IconData icon;
  final Color iconColor;

  const PackageCardWidget({
    super.key,
    required this.package,
    required this.icon,
    this.iconColor = const Color(0xFF14244B),
  });

  Future<void> _launchUrl(String url) async {
    if (url.isEmpty) return;
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final badgeText = isArabic ? package.badgeAr : package.badge;
    final isHighlighted = package.isFeatured;

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
            if (badgeText.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Text(
                  badgeText,
                  style: AppTextStyle.setStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF259CCB),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            // The actual card
            _buildMainCard(context, isArabic),
          ],
        ),
      );
    }

    // Normal unhighlighted card
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: _buildMainCard(context, isArabic),
    );
  }

  Widget _buildMainCard(BuildContext context, bool isArabic) {
    final title = isArabic ? package.title : package.title;
    final displayTitle = title.isNotEmpty ? title : package.title;
    final displayDescription = package.description;
    final displayBillingCycle = isArabic
        ? package.billingCycleAr
        : package.billingCycle;
    final isHighlighted = package.isFeatured;

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
              Expanded(
                child: Text(
                  displayTitle,
                  style: AppTextStyle.setStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF14244B),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),

          // Subtitle (Description)
          Text(
            displayDescription,
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
          ...package.features.map((feature) {
            final featureTitle = isArabic ? feature.titleAr : feature.title;
            return Padding(
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
                      featureTitle,
                      style: AppTextStyle.setStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),

          SizedBox(height: 16.h),

          // Price Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '${package.price}',
                style: AppTextStyle.setStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
                textDirection: TextDirection.ltr,
              ),
              SizedBox(width: 4.w),
              Text(
                package.currency.isNotEmpty
                    ? package.currency
                    : 'pkg_currency'.tr(context),
                style: AppTextStyle.setStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              if (displayBillingCycle.isNotEmpty) ...[
                SizedBox(width: 4.w),
                Text(
                  '/$displayBillingCycle',
                  style: AppTextStyle.setStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: 24.h),

          // Button
          InkWell(
            onTap: () {
              final ctaUrl = isArabic ? package.ctaUrlAr : package.ctaUrl;
              final finalUrl = ctaUrl.isNotEmpty ? ctaUrl : package.ctaUrl;
              _launchUrl(finalUrl);
            },
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
                    Icons.chat_outlined,
                    color: isHighlighted ? Colors.white : Colors.green,
                    size: 18.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    isArabic && package.ctaLabelAr.isNotEmpty
                        ? package.ctaLabelAr
                        : package.ctaLabel.isNotEmpty
                        ? package.ctaLabel
                        : 'pkg_contact_btn'.tr(context),
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

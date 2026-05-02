import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/features/packages/domain/entities/package_entity.dart';

class PricingCardWidget extends StatelessWidget {
  final PackageEntity package;

  const PricingCardWidget({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final ctaText = isArabic ? package.ctaLabelAr : package.ctaLabel;

    return Container(
      width: 344.w,
      height: 220.h,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFD9D9D9), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Right side: Info (First in Row = Right in RTL)
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        package.title,
                        style: AppTextStyle.setStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.bgBlue900,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        package.description,
                        style: AppTextStyle.setStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.n400,
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${package.price}',
                            style: AppTextStyle.setStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppColors.bgBlue900,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icon/RSA.svg',
                            width: 14.w,
                            height: 16.h,
                            colorFilter: const ColorFilter.mode(
                              AppColors.bgBlue900,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '/${isArabic ? "شهريا" : "monthly"}',
                            style: AppTextStyle.setStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.n400,
                            ),
                          ),
                          const SizedBox(width: 4),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                // Left side: Features (Second in Row = Left in RTL)
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: package.features.take(4).map((feature) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                              size: 16.r,
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                isArabic ? feature.titleAr : feature.title,
                                style: AppTextStyle.setStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.n500,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
                size: 20,
              ),
              label: Text(
                ctaText.isEmpty ? 'تواصل واتساب' : ctaText,
                style: AppTextStyle.setStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF259CCB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

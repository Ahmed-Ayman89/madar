import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';

import 'package:cached_network_image/cached_network_image.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return Container(
      width: 220.w,
      height: 350.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFF2F2F2), width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0x2E000000), // #0000002E
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article Image (Back to Top)
            Container(
              height: 153.h, // Fixed height to match design proportions
              width: double.infinity,
              margin: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  imageUrl: 'https://via.placeholder.com/241x150',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[100],
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error_outline, color: Colors.grey),
                ),
              ),
            ),
            // Text Content (Back to Bottom)
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'article_1_title'.tr(context),
                      style: AppTextStyle.setStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF182D62),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'article_1_desc'.tr(context),
                      style: AppTextStyle.setStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.n300,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                    const Spacer(),
                    // Learn More Link
                    Row(
                      mainAxisAlignment: isRtl
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        Text(
                          'learn_more'.tr(context),
                          style: AppTextStyle.setStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF259CCB),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          isRtl ? Icons.arrow_forward : Icons.arrow_back,
                          size: 16,
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';

import 'package:cached_network_image/cached_network_image.dart';

class WorkProjectCard extends StatelessWidget {
  const WorkProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return Container(
      width: 343.w,
      height: 153.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFF2F2F2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Row(
          children: [
            // Content (Now on Left in LTR)
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tickets Logo Placeholder
                    Align(
                      alignment: isRtl ? Alignment.topRight : Alignment.topLeft,
                      child: Container(
                        width: 60.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFF182D62),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Center(
                          child: Text(
                            'Tickets',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'project_tickets_title'.tr(context),
                      style: AppTextStyle.setStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF182D62),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'project_tickets_desc'.tr(context),
                      style: AppTextStyle.setStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: AppColors.n300,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    // Learn More Link
                    Row(
                      mainAxisAlignment: isRtl
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Text(
                          'learn_more'.tr(context),
                          style: AppTextStyle.setStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF259CCB),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          isRtl ? Icons.arrow_back : Icons.arrow_forward,
                          size: 14,
                          color: const Color(0xFF259CCB),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Project Image (Now on Right in LTR)
            Container(
              width: 140.w,
              height: double.infinity,
              margin: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  imageUrl: 'https://via.placeholder.com/140x137',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[200],
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

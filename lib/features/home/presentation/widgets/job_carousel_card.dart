import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:madar/core/routing/routes.dart';
import 'package:madar/features/careers/domain/entities/job_entity.dart';

class JobCarouselCard extends StatelessWidget {
  final JobEntity job;

  const JobCarouselCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;

    // Simple logic for "posted ago" since I don't have timeago package confirmed
    final difference = DateTime.now().difference(job.createdAt);
    String timeStr;
    if (difference.inDays > 0) {
      timeStr = isRtl
          ? 'منذ ${difference.inDays} يوم'
          : '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      timeStr = isRtl
          ? 'منذ ${difference.inHours} ساعة'
          : '${difference.inHours} hours ago';
    } else {
      timeStr = isRtl ? 'الآن' : 'Just now';
    }

    return Container(
      width: 271.w,
      height: 178.h,
      decoration: BoxDecoration(
        color: const Color(0xFF182D62),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFD9D9D9), width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0x2E000000),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section: Logo + Title + Subtitle
            Row(
              children: [
                // Icon Placeholder (White square with light blue icon)
                Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFF259CCB),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: const Icon(
                        Icons.bolt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.title,
                        style: AppTextStyle.setStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '${job.type} • ${job.location}', // Subtitle
                        style: AppTextStyle.setStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            // Tags Section
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                children: [
                  _buildTag(job.type),
                  SizedBox(width: 8.w),
                  _buildTag('On site'),
                  SizedBox(width: 8.w),
                  _buildTag(job.location),
                ],
              ),
            ),
            const Spacer(),
            // Bottom Section: Time + Apply Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.white.withOpacity(0.7),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      timeStr,
                      style: AppTextStyle.setStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    context.push(Routes.kJobDetailsView, extra: job.id);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF259CCB),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      'apply_now'.tr(context),
                      style: AppTextStyle.setStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    if (text.isEmpty) return const SizedBox.shrink();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: AppTextStyle.setStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

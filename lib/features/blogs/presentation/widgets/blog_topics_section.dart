import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';

class BlogTopicsSection extends StatelessWidget {
  const BlogTopicsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> topics = [
      'topic_technology',
      'topic_marketing',
      'topic_seo',
      'topic_growth',
      'topic_uiux',
      'topic_ai',
      'topic_flutter',
      'topic_technology',
      'topic_development',
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: Colors.black.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, // For RTL title
          children: [
            Text(
              'blog_explore_topics'.tr(context),
              style: AppTextStyle.setStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 24.h),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Wrap(
                spacing: 12.w,
                runSpacing: 12.h,
                alignment: WrapAlignment.end,
                children: topics
                    .map((topic) => _buildTopicChip(topic.tr(context)))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopicChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEBF7FB),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        label,
        style: AppTextStyle.setStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF1B3D6D),
        ),
      ),
    );
  }
}

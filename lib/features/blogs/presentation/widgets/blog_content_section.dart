import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';

import 'package:madar/core/localization/app_localizations.dart';

class BlogContentSection extends StatelessWidget {
  const BlogContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeading('blog_heading_overview'.tr(context)),
          _buildParagraph(
            'blog_overview_text'.tr(context),
          ),
          SizedBox(height: 30.h),
          _buildHeading('blog_heading_market'.tr(context)),
          _buildParagraph(
            'blog_market_intro'.tr(context),
          ),
          SizedBox(height: 16.h),
          _buildBulletPoint('blog_market_item1'.tr(context)),
          _buildBulletPoint('blog_market_item2'.tr(context)),
          _buildBulletPoint('blog_market_item3'.tr(context)),
          _buildBulletPoint('blog_market_item4'.tr(context)),
          _buildBulletPoint('blog_market_item5'.tr(context)),
          SizedBox(height: 40.h),
          _buildHeading('blog_heading_social'.tr(context)),
          _buildParagraph(
            'blog_social_text1'.tr(context),
          ),
          SizedBox(height: 30.h),
          // Side by side images
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    'assets/photo/onboard2.jpg',
                    height: 150.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    'assets/photo/onboard3.jpg',
                    height: 150.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          _buildParagraph(
            'blog_social_text2'.tr(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeading(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        text,
        style: AppTextStyle.setStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: AppTextStyle.setStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ).copyWith(height: 1.8),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 8.h),
            width: 4.r,
            height: 4.r,
            decoration: const BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
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
  }
}

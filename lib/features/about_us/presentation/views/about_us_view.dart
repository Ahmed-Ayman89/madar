import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/widgets/CustomElevatedButton_widget.dart';
import 'package:madar/core/widgets/custom_header_widget.dart';
import 'package:madar/features/services/presentation/widgets/tech_field_card.dart';
import 'package:madar/features/services/presentation/widgets/faq_item_widget.dart';

import '../widgets/about_us_value_card.dart';
import '../widgets/stat_item_widget.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Distinguishing features
    final List<Map<String, dynamic>> distinguishes = [
      {
        'title': 'about_dist_1_title'.tr(context),
        'desc': 'about_dist_1_desc'.tr(context),
        'icon': Icons.lightbulb_outline,
      },
      {
        'title': 'about_dist_2_title'.tr(context),
        'desc': 'about_dist_2_desc'.tr(context),
        'icon': Icons.speed_outlined,
      },
      {
        'title': 'about_dist_3_title'.tr(context),
        'desc': 'about_dist_3_desc'.tr(context),
        'icon': Icons.security_outlined,
      },
      {
        'title': 'about_dist_4_title'.tr(context),
        'desc': 'about_dist_4_desc'.tr(context),
        'icon': Icons.group_outlined,
      },
      {
        'title': 'about_dist_5_title'.tr(context),
        'desc': 'about_dist_5_desc'.tr(context),
        'icon': Icons.architecture_outlined,
      },
      {
        'title': 'about_dist_6_title'.tr(context),
        'desc': 'about_dist_6_desc'.tr(context),
        'icon': Icons.thumbs_up_down_outlined, // closest to flexible UX
      },
    ];

    // FAQ data
    final List<Map<String, String>> faqItems = [
      {'q': 'faq_q1'.tr(context), 'a': 'faq_a1'.tr(context)},
      {'q': 'faq_q2'.tr(context), 'a': 'faq_a2'.tr(context)},
      {'q': 'faq_q3'.tr(context), 'a': 'faq_a3'.tr(context)},
      {'q': 'faq_q4'.tr(context), 'a': 'faq_a4'.tr(context)},
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF14244B),
        elevation: 0,
        leading: const BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SECTION 1: Header with Info and Value Cards OVERLAPPING visually inside the header bounds
            CustomHeaderWidget(
              title: 'about_header_title'.tr(context),
              titleStyle: AppTextStyle.setStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF259CCB),
              ),
              subtitle: 'about_header_subtitle'.tr(context),
              subtitleStyle: AppTextStyle.setWhite(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
              content: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      'about_header_desc'.tr(context),
                      style:
                          AppTextStyle.setWhite(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ).copyWith(
                            color: Colors.white.withOpacity(0.85),
                            height: 1.5,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  CustomElevatedButton(
                    onPressed: () {},
                    text: 'about_header_btn'.tr(context),
                    // backgroundColor: const Color(0xFF259CCB),
                    // textColor: Colors.white,
                    // width: 200.w,
                    // height: 48.h,
                    // isStroked: false,
                  ),
                  SizedBox(height: 40.h),
                  // The 3 overlapping cards
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: AboutUsValueCard(
                            title: 'about_val_vision_title'.tr(context),
                            description: 'about_val_vision_desc'.tr(context),
                            icon: Icons.lightbulb_circle,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: AboutUsValueCard(
                            title: 'about_val_mission_title'.tr(context),
                            description: 'about_val_mission_desc'.tr(context),
                            icon: Icons.flag,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: AboutUsValueCard(
                            title: 'about_val_goals_title'.tr(context),
                            description: 'about_val_goals_desc'.tr(context),
                            icon: Icons.track_changes,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),

            // SECTION 2: What Distinguishes Us
            SizedBox(height: 60.h),
            Column(
              children: [
                Text(
                  'about_dist_title'.tr(context),
                  style: AppTextStyle.setStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF259CCB),
                  ),
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    'about_dist_subtitle'.tr(context),
                    style: AppTextStyle.setStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ).copyWith(height: 1.3),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    'about_dist_desc'.tr(context),
                    style: AppTextStyle.setStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ).copyWith(height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30.h),
                // Grid View for Tech Fields (Distinguishes)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: 168 / 130, // TechFieldCard ratio
                    ),
                    itemCount: distinguishes.length,
                    itemBuilder: (context, index) {
                      return TechFieldCard(
                        title: distinguishes[index]['title'],
                        description: distinguishes[index]['desc'],
                        icon: Icon(
                          distinguishes[index]['icon'],
                          color: Colors.white,
                          size: 14.sp,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            // SECTION 3: Facts & Stats
            SizedBox(height: 60.h),
            Text(
              'about_stats_title'.tr(context),
              style: AppTextStyle.setStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF259CCB),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                'about_stats_desc'.tr(context),
                style: AppTextStyle.setStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ).copyWith(height: 1.6),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  // Use expanded with small dividers between them
                  Expanded(
                    child: StatItemWidget(
                      number: 'about_stat_1_num'.tr(context),
                      title: 'about_stat_1_title'.tr(context),
                      description: 'about_stat_1_desc'.tr(context),
                    ),
                  ),
                  Container(width: 1, height: 60.h, color: Colors.grey[300]),
                  Expanded(
                    child: StatItemWidget(
                      number: 'about_stat_2_num'.tr(context),
                      title: 'about_stat_2_title'.tr(context),
                      description: 'about_stat_2_desc'.tr(context),
                    ),
                  ),
                  Container(width: 1, height: 60.h, color: Colors.grey[300]),
                  Expanded(
                    child: StatItemWidget(
                      number: 'about_stat_3_num'.tr(context),
                      title: 'about_stat_3_title'.tr(context),
                      description: 'about_stat_3_desc'.tr(context),
                    ),
                  ),
                ],
              ),
            ),

            // SECTION 4: FAQ (Reused from Services)
            SizedBox(height: 60.h),
            Text(
              'faq_category'.tr(context),
              style: AppTextStyle.setStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF259CCB),
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                'faq_title'.tr(context),
                style: AppTextStyle.setStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Text(
                'faq_description'.tr(context),
                style: AppTextStyle.setStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ).copyWith(height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: faqItems.length,
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  return FaqItemWidget(
                    question: faqItems[index]['q']!,
                    answer: faqItems[index]['a']!,
                  );
                },
              ),
            ),

            SizedBox(height: 80.h), // Bottom padding
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/widgets/custom_header_widget.dart';
import 'package:madar/features/services/presentation/widgets/faq_item_widget.dart';
import '../widgets/contact_form_widget.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqItems = [
      {'q': 'faq_q1'.tr(context), 'a': 'faq_a1'.tr(context)},
      {'q': 'faq_q2'.tr(context), 'a': 'faq_a2'.tr(context)},
      {'q': 'faq_q3'.tr(context), 'a': 'faq_a3'.tr(context)},
      {'q': 'faq_q4'.tr(context), 'a': 'faq_a4'.tr(context)},
    ];
    return Scaffold(
      backgroundColor: Colors.white, // Though most will be covered by header
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomHeaderWidget(
              title: 'contact_header_category'.tr(context),
              titleStyle: AppTextStyle.setStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF259CCB),
              ),
              subtitle: 'contact_header_title'.tr(context),
              subtitleStyle: AppTextStyle.setWhite(
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
              content: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      'contact_header_description'.tr(context),
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
                  SizedBox(height: 40.h),
                  // Social Media Icons Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon(
                        Image.asset('assets/photo/facebook.png'),
                      ), // YouTube
                      SizedBox(width: 12.w),
                      _buildSocialIcon(
                        Image.asset('assets/photo/instagram.png'),
                      ), // X
                      SizedBox(width: 12.w),
                      _buildSocialIcon(
                        Image.asset('assets/photo/linkedin.png'),
                      ), // LinkedIn
                      SizedBox(width: 12.w),
                      _buildSocialIcon(
                        Image.asset('assets/photo/new-twitter.png'),
                      ), // Instagram
                      SizedBox(width: 12.w),
                      _buildSocialIcon(
                        Image.asset('assets/photo/youtube.png'),
                      ), // Facebook
                    ],
                  ),
                  SizedBox(height: 24.h),

                  // The Contact Form Widget
                  const ContactFormWidget(),
                ],
              ),
            ),

            // SECTION: FAQ
            SizedBox(height: 50.h),
            Column(
              children: [
                Text(
                  'faq_category'.tr(context),
                  style: AppTextStyle.setStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF259CCB),
                  ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    'faq_main_title'.tr(context),
                    style: AppTextStyle.setStyle(
                      fontSize: 24,
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
                    'faq_description'.tr(context),
                    style: AppTextStyle.setStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.7),
                    ).copyWith(height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40.h),
                // List of FAQ items
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: faqItems.length,
                    itemBuilder: (context, index) {
                      return FaqItemWidget(
                        question: faqItems[index]['q']!,
                        answer: faqItems[index]['a']!,
                      );
                    },
                  ),
                ),
              ],
            ),

            // Bottom spacing or footer if any
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(Widget icon) {
    return Container(
      width: 32.w,
      height: 32.w, // Using width for both to ensure perfect circle
      decoration: const BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Center(child: icon),
    );
  }
}

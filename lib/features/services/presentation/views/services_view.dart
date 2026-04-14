import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/widgets/custom_header_widget.dart';
import '../widgets/service_grid_item.dart';
import '../widgets/tech_field_card.dart';
import '../widgets/faq_item_widget.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    // Service data for the first section
    final List<Map<String, dynamic>> services = [
      {
        'title': 'service_web_title'.tr(context),
        'desc': 'service_web_desc'.tr(context),
        'icon': Icons.language,
      },
      {
        'title': 'service_mobile_title'.tr(context),
        'desc': 'service_mobile_desc'.tr(context),
        'icon': Icons.stay_primary_portrait,
      },
      {
        'title': 'service_ecommerce_title'.tr(context),
        'desc': 'service_ecommerce_desc'.tr(context),
        'icon': Icons.shopping_basket_outlined,
      },
      {
        'title': 'service_admin_title'.tr(context),
        'desc': 'service_admin_desc'.tr(context),
        'icon': Icons.dashboard_customize_outlined,
      },
      {
        'title': 'service_seo_title'.tr(context),
        'desc': 'service_seo_desc'.tr(context),
        'icon': Icons.troubleshoot_outlined,
      },
      {
        'title': 'service_marketing_title'.tr(context),
        'desc': 'service_marketing_desc'.tr(context),
        'icon': Icons.campaign_outlined,
      },
    ];

    // Data for technical fields
    final List<Map<String, dynamic>> techFields = [
      {
        'title': 'tech_frontend_title'.tr(context),
        'desc': 'tech_frontend_desc'.tr(context),
        'icon': Icons.code,
      },
      {
        'title': 'tech_backend_title'.tr(context),
        'desc': 'tech_backend_desc'.tr(context),
        'icon': Icons.storage,
      },
      {
        'title': 'tech_flutter_title'.tr(context),
        'desc': 'tech_flutter_desc'.tr(context),
        'icon': Icons.flutter_dash,
      },
      {
        'title': 'tech_uiux_title'.tr(context),
        'desc': 'tech_uiux_desc'.tr(context),
        'icon': Icons.design_services,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SECTION 1: Services Header & Grid
            CustomHeaderWidget(
              title: 'services_page_title'.tr(context),
              titleStyle: AppTextStyle.setStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF259CCB),
              ),
              subtitle: 'services_page_subtitle'.tr(context),
              subtitleStyle: AppTextStyle.setWhite(
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
              content: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      'services_page_description'.tr(context),
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
                  SizedBox(height: 45.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        return ServiceCard(
                          title: services[index]['title'],
                          description: services[index]['desc'],
                          icon: services[index]['icon'],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            ),

            // SECTION 2: Technical Fields
            SizedBox(height: 60.h),
            Column(
              children: [
                Text(
                  'tech_fields_category'.tr(context),
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
                    'tech_fields_main_title'.tr(context),
                    style: AppTextStyle.setStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ).copyWith(height: 1.3),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40.h),
                // Grid View for Tech Fields
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: 168 / 130,
                    ),
                    itemCount: techFields.length,
                    itemBuilder: (context, index) {
                      return TechFieldCard(
                        title: techFields[index]['title'],
                        description: techFields[index]['desc'],
                        icon: Icon(
                          techFields[index]['icon'],
                          color: Colors.white,
                          size: 14.sp,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            // SECTION 3: FAQ
            SizedBox(height: 80.h),
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
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}

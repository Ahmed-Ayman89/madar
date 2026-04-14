import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/widgets/CustomElevatedButton_widget.dart';
import 'package:madar/core/widgets/custom_header_widget.dart';

import '../widgets/project_card_widget.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample project data
    final List<Map<String, String>> projects = [
      {
        'title': 'project_tickets_web_title'.tr(context),
        'desc': 'project_tickets_web_desc'.tr(context),
        'image': 'assets/photo/onboard1.jpg',
        'logo': 'assets/photo/madar_logo.png', // Placeholder for project logo
      },
      {
        'title': 'project_tickets_app_title'.tr(context),
        'desc': 'project_tickets_app_desc'.tr(context),
        'image': 'assets/photo/onboard2.jpg',
        'logo': 'assets/photo/madar_logo.png',
      },
      {
        'title': 'project_tickets_web_title'.tr(context),
        'desc': 'project_tickets_web_desc'.tr(context),
        'image': 'assets/photo/onboard3.jpg',
        'logo': 'assets/photo/madar_logo.png',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomHeaderWidget(
              title: 'projects_header_category'.tr(context),
              titleStyle: AppTextStyle.setStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF259CCB),
              ),
              subtitle: 'projects_header_subtitle'.tr(context),
              subtitleStyle: AppTextStyle.setWhite(
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
              content: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      'projects_header_description'.tr(context),
                      style: AppTextStyle.setWhite(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ).copyWith(
                        color: Colors.white.withOpacity(0.85),
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 35.h),
                  CustomElevatedButton(
                    text: 'projects_header_button'.tr(context),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            
            // SECTION: Latest Projects
            SizedBox(height: 50.h),
            Column(
              children: [
                Text(
                  'projects_latest_title'.tr(context),
                  style: AppTextStyle.setStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    'projects_latest_description'.tr(context),
                    style: AppTextStyle.setStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.6),
                    ).copyWith(height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40.h),
                
                // Vertical list of project cards
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      return ProjectCardWidget(
                        title: projects[index]['title']!,
                        description: projects[index]['desc']!,
                        imagePath: projects[index]['image']!,
                        logoPath: projects[index]['logo'],
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

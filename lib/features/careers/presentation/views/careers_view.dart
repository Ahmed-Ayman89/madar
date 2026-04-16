import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/widgets/custom_header_widget.dart';
import '../widgets/team_card_widget.dart';
import '../widgets/job_card_widget.dart';
import '../widgets/filter_dropdown_widget.dart';

class CareersView extends StatelessWidget {
  const CareersView({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for team members
    final List<Map<String, String>> teamMembers = [
      {
        'name': 'Mauro Sicard',
        'title': 'product designer',
        'image': 'assets/photo/madar_logo.png', // Fallback to an existing image
      },
      {
        'name': 'Mauro Sicard',
        'title': 'product designer',
        'image': 'assets/photo/madar_logo.png',
      },
      {
        'name': 'Mauro Sicard',
        'title': 'product designer',
        'image': 'assets/photo/madar_logo.png',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomHeaderWidget(
              title: 'team_title'.tr(context),
              titleStyle: AppTextStyle.setWhite(
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
              subtitle: 'team_category'.tr(context),
              subtitleStyle: AppTextStyle.setStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF259CCB),
              ),
              content: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      'team_description'.tr(context),
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
                  SizedBox(height: 40.h),
                  SizedBox(
                    height: 250.h,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: teamMembers.length,
                      separatorBuilder: (context, index) => SizedBox(width: 16.w),
                      itemBuilder: (context, index) {
                        final member = teamMembers[index];
                        return TeamCardWidget(
                          name: member['name']!,
                          title: member['title']!,
                          imagePath: member['image']!,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
            
            // SECTION 2: Join Our Team
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'join_team_title'.tr(context),
                    style: AppTextStyle.setStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      'join_team_desc'.tr(context),
                      style: AppTextStyle.setStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ).copyWith(height: 1.6),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  
                  // Filters Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilterDropdownWidget(text: 'filter_on_site'.tr(context)),
                      FilterDropdownWidget(text: 'filter_all_teams'.tr(context)),
                      FilterDropdownWidget(text: 'filter_full_time'.tr(context)),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  
                  // Job Listing
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: 3, // Dummy count
                    itemBuilder: (context, index) {
                      return const JobCardWidget(
                        title: 'Backend Developer',
                        experience: '(Mid-Level • 2-3 Years)',
                        type: 'On site',
                        location: 'Mansoura',
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
}

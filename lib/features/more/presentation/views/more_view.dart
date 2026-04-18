import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';

import '../widgets/more_grid_item.dart';
import '../widgets/more_list_item.dart';
import 'package:madar/features/about_us/presentation/views/about_us_view.dart';
import 'package:madar/features/packages/presentation/views/packages_view.dart';
import 'package:madar/features/careers/presentation/views/careers_view.dart';
import 'package:madar/features/blogs/presentation/views/blogs_view.dart';
import 'package:madar/features/settings/presentation/views/settings_details_view.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    // Grid items list
    final List<Map<String, dynamic>> gridItems = [
      {
        'title': 'more_packages'.tr(context),
        'imagePath': 'assets/icon/pacakge.png',
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PackagesView()),
        ),
      },
      {
        'title': 'more_about_us'.tr(context),
        'imagePath': 'assets/icon/about us.png',
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AboutUsView()),
        ),
      },
      {
        'title': 'more_our_work'.tr(context),
        'imagePath': 'assets/icon/ourWork.png',
      },
      {
        'title': 'more_services'.tr(context),
        'imagePath': 'assets/icon/services.png',
      },
      {
        'title': 'more_articles'.tr(context),
        'imagePath': 'assets/icon/blog.png',
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const BlogsView()),
        ),
      },
      {
        'title': 'more_employment'.tr(context),
        'imagePath': 'assets/icon/Jop.png',
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CareersView()),
        ),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF142652),
        title: Text(
          'settings'.tr(context),
          style: AppTextStyle.setWhite(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Grid Section
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 163.5 / 60,
                ),
                itemCount: gridItems.length,
                itemBuilder: (context, index) {
                  return MoreGridItemWidget(
                    title: gridItems[index]['title'],
                    imagePath: gridItems[index]['imagePath'],
                    onTap: gridItems[index]['onTap'],
                  );
                },
              ),
            ),

            // Separator Title
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'settings'.tr(context),
                  style: AppTextStyle.setStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.n400,
                  ),
                ),
              ),
            ),

            // List Section
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  MoreListItemWidget(
                    title: 'more_contact_us'.tr(context),
                    imagePath: 'assets/icon/call us.png',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SettingsDetailsView()),
                    ),
                  ),
                  MoreListItemWidget(
                    title: 'more_terms'.tr(context),
                    imagePath: 'assets/icon/Terms&&condatios.png',
                  ),
                  MoreListItemWidget(
                    title: 'more_country'.tr(context),
                    imagePath: 'assets/icon/world.png',
                    trailingWidget: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Placeholder for Saudi flag image/icon
                        Container(
                          width: 24.w,
                          height: 16.h,
                          color: Colors.green[800],
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 8.sp,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14.sp,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                  MoreListItemWidget(
                    title: 'more_currency'.tr(context),
                    imagePath: 'assets/icon/coin.png',
                    trailingWidget: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'more_sar'.tr(context),
                          style: AppTextStyle.setStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14.sp,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 120.h),
          ],
        ),
      ),
    );
  }
}

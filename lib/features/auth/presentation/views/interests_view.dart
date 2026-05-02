import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/routing/routes.dart';
import 'package:madar/core/widgets/custom_auth_button.dart';
import 'package:madar/core/helper/app_text_style.dart';

class InterestsView extends StatefulWidget {
  const InterestsView({super.key});

  @override
  State<InterestsView> createState() => _InterestsViewState();
}

class _InterestsViewState extends State<InterestsView> {
  final List<String> _interests = [
    'digital_marketing',
    'programming',
    'web_dev',
    'app_dev',
    'seo',
    'social_media_mgmt',
    'graphic_design',
    'ui_ux_design',
    'e_commerce',
    'visual_identity_tag',
  ];

  final Set<String> _selectedInterests = {
    'digital_marketing',
    'programming',
    'app_dev',
    'seo',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              'what_interests_you'.tr(context),
              style: AppTextStyle.setStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'interests_desc'.tr(context),
              style: AppTextStyle.setStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 32.h),

            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 12.w,
                  runSpacing: 12.h,
                  children: _interests.map((interest) {
                    final bool isSelected = _selectedInterests.contains(
                      interest,
                    );
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedInterests.remove(interest);
                          } else {
                            _selectedInterests.add(interest);
                          }
                        });
                      },
                      child: Container(
                        height: 46.h,
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xE5EBF7FB)
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF7CC9E7)
                                : AppColors.n40,
                            width: 1.w,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x3DE4E5E7),
                              blurRadius: 2,
                              offset: Offset(0, 1),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: IntrinsicWidth(
                          child: Center(
                            child: Text(
                              interest.tr(context),
                              style: AppTextStyle.setStyle(
                                fontSize: 14,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: isSelected
                                    ? const Color(0xFF1F7FAF)
                                    : AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: 375.w,
        height: 88.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0x24000000),
              blurRadius: 8,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: CustomAuthButton(
          text: 'start_now_btn'.tr(context),
          width: double.infinity,
          onPressed: () {
            context.go(Routes.kMainView); // Navigate to main app
          },
        ),
      ),
    );
  }
}

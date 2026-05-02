import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/routing/routes.dart';
import 'package:madar/core/widgets/custom_auth_button.dart';
import 'package:madar/features/auth/presentation/widgets/selection_card.dart';

class UserTypeView extends StatefulWidget {
  const UserTypeView({super.key});

  @override
  State<UserTypeView> createState() => _UserTypeViewState();
}

class _UserTypeViewState extends State<UserTypeView> {
  int _selectedType = 1; // Default to 'Project Owner' based on screenshot

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
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              'select_user_type'.tr(context),
              style: AppTextStyle.setStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'select_user_type_desc'.tr(context),
              style: AppTextStyle.setStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 32.h),

            // Personal
            SelectionCard(
              title: 'personal'.tr(context),
              description: 'personal_desc'.tr(context),
              isSelected: _selectedType == 0,
              icon: Icon(
                Icons.person_outline,
                color: _selectedType == 0
                    ? AppColors.primaryBlue
                    : AppColors.primaryBlue.withOpacity(0.5),
              ),
              onTap: () => setState(() => _selectedType = 0),
            ),
            SizedBox(height: 16.h),

            // Project Owner
            SelectionCard(
              title: 'project_owner'.tr(context),
              description: 'project_owner_desc'.tr(context),
              isSelected: _selectedType == 1,
              icon: Icon(
                Icons.business_center_outlined,
                color: _selectedType == 1
                    ? Colors.orange
                    : Colors.orange.withOpacity(0.5),
              ),
              onTap: () => setState(() => _selectedType = 1),
            ),
            SizedBox(height: 16.h),

            // Job Seeker
            SelectionCard(
              title: 'job_seeker'.tr(context),
              description: 'job_seeker_desc'.tr(context),
              isSelected: _selectedType == 2,
              icon: Icon(
                Icons.person_search_outlined,
                color: _selectedType == 2
                    ? Colors.purple
                    : Colors.purple.withOpacity(0.5),
              ),
              onTap: () => setState(() => _selectedType = 2),
            ),

            const Spacer(),
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
          text: 'complete'.tr(context),
          width: double.infinity,
          onPressed: () {
            context.push(Routes.kInterestsView);
          },
        ),
      ),
    );
  }
}

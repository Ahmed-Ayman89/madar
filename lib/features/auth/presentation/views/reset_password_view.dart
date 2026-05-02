import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/routing/routes.dart';
import 'package:madar/core/widgets/custom_auth_button.dart';
import 'package:madar/core/widgets/custom_text_field.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 812.h,
          width: 375.w,
          child: Stack(
            children: [
              // Background
              Column(
                children: [
                  Container(
                    height: 406.h,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/photo/background.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: const Color(0xFFFBFBFB),
                    ),
                  ),
                ],
              ),

              // Header
              Positioned(
                top: 44.h,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 40),
                          Image.asset(
                            'assets/photo/madar_header.png',
                            height: 40.h,
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward,
                                color: AppColors.white),
                            onPressed: () => context.pop(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'reset_password_title'.tr(context),
                      textAlign: TextAlign.center,
                      style: AppTextStyle.setStyle(
                        color: AppColors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'reset_password_desc'.tr(context),
                      style: AppTextStyle.setStyle(
                        color: AppColors.white.withOpacity(0.8),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              // Form Container
              Positioned(
                top: 310.h,
                left: 24.w,
                right: 24.w,
                child: Container(
                  width: 327.w,
                  padding: EdgeInsets.all(24.r),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '* ' + 'new_password'.tr(context),
                        style: AppTextStyle.setStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: '*******',
                        isPassword: !_isPasswordVisible,
                        width: 279.w,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            size: 18.sp,
                            color: AppColors.n200,
                          ),
                          onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      
                      Text(
                        '* ' + 'confirm_new_password'.tr(context),
                        style: AppTextStyle.setStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        controller: _confirmPasswordController,
                        hintText: '*******',
                        isPassword: !_isConfirmVisible,
                        width: 279.w,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isConfirmVisible ? Icons.visibility : Icons.visibility_off,
                            size: 18.sp,
                            color: AppColors.n200,
                          ),
                          onPressed: () => setState(() => _isConfirmVisible = !_isConfirmVisible),
                        ),
                      ),
                      SizedBox(height: 32.h),

                      // Confirm Button
                      CustomAuthButton(
                        text: 'confirm_btn'.tr(context),
                        onPressed: () {
                          context.go(Routes.kLoginView);
                        },
                        width: 279.w,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

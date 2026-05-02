import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/routing/routes.dart';
import 'package:madar/core/widgets/custom_auth_button.dart';
import 'package:madar/core/widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 812.h,
          width: 375.w,
          child: Stack(
            children: [
              // Background: Top half Image, Bottom half White
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

              // Header and Title Area
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
                          const SizedBox(width: 40), // Placeholder for symmetry
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
                      'login_to_account'.tr(context),
                      textAlign: TextAlign.center,
                      style: AppTextStyle.setStyle(
                        color: AppColors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'dont_have_account'.tr(context),
                          style: AppTextStyle.setStyle(
                            color: AppColors.white.withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.push(Routes.kSignUpView);
                          },
                          child: Text(
                            'register_now'.tr(context),
                            style: AppTextStyle.setStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ).copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Form Container
              Positioned(
                top: 315.h, // Adjusted for Login layout
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
                    children: [
                      // Social Login
                      Container(
                        width: 279.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: AppColors.n40),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icon/google.svg',
                                width: 20.w),
                            SizedBox(width: 8.w),
                            Text(
                              'continue_with_google'.tr(context),
                              style: AppTextStyle.setStyle(
                                color: AppColors.textPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // Divider
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              'or_login_using'.tr(context),
                              style: AppTextStyle.setStyle(
                                color: AppColors.n200,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(height: 16.h),

                      // Email Field
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'email'.tr(context),
                        width: 279.w,
                      ),
                      SizedBox(height: 16.h),

                      // Password Field
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'password'.tr(context),
                        isPassword: !_isPasswordVisible,
                        width: 279.w,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 20.sp,
                            color: AppColors.n200,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 12.h),

                      // Remember Me & Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              context.push(Routes.kForgotPasswordView);
                            },
                            child: Text(
                              'forgot_password'.tr(context),
                              style: AppTextStyle.setStyle(
                                color: const Color(0xFF3BAEDB),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'remember_me'.tr(context),
                                style: AppTextStyle.setStyle(
                                  color: AppColors.n500,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Checkbox(
                                value: _rememberMe,
                                activeColor: AppColors.primaryBlue,
                                onChanged: (val) {
                                  setState(() {
                                    _rememberMe = val ?? false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),

                      // Login Button
                      CustomAuthButton(
                        text: 'login_btn'.tr(context),
                        onPressed: () {
                          context.go(Routes.kMainView);
                        },
                        width: 279.w,
                      ),
                      SizedBox(height: 16.h),

                      // Continue as Guest
                      GestureDetector(
                        onTap: () => context.go(Routes.kMainView),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.person_outline,
                                size: 18, color: AppColors.textPrimary),
                            SizedBox(width: 4.w),
                            Text(
                              'continue_as_guest'.tr(context),
                              style: AppTextStyle.setStyle(
                                color: AppColors.textPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
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

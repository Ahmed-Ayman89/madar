import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/routing/routes.dart';
import 'package:madar/core/widgets/custom_auth_button.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({super.key});

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 44.w,
      height: 44.h,
      textStyle: AppTextStyle.setStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(color: AppColors.n40),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3DE4E5E7),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
    );

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
                      'otp_verification_title'.tr(context),
                      textAlign: TextAlign.center,
                      style: AppTextStyle.setStyle(
                        color: AppColors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 48.w),
                      child: Text(
                        'otp_verification_desc'.tr(context),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.setStyle(
                          color: AppColors.white.withOpacity(0.8),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // OTP Container
              Positioned(
                top: 305.h,
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
                      Text(
                        'otp_verification_title'.tr(context),
                        style: AppTextStyle.setStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'otp_verification_desc'.tr(context),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.setStyle(
                          color: AppColors.n500,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // Pinput
                      Pinput(
                        length: 6,
                        controller: _otpController,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            border: Border.all(color: AppColors.primaryBlue),
                          ),
                        ),
                        separatorBuilder: (index) => SizedBox(width: 8.w),
                      ),
                      SizedBox(height: 24.h),

                      // Resend Code
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'resend_code'.tr(context),
                              style: AppTextStyle.setStyle(
                                color: const Color(0xFF3BAEDB),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                height: 1,
                              ).copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Text(
                            'didnt_receive_code'.tr(context),
                            style: AppTextStyle.setStyle(
                              color: AppColors.n500,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),

                      // Verify Button
                      CustomAuthButton(
                        text: 'verify_code_btn'.tr(context),
                        onPressed: () {
                          context.push(Routes.kResetPasswordView);
                        },
                        width: 279.w,
                      ),
                      SizedBox(height: 16.h),

                      // Timer Hint
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '20 ' + 'seconds'.tr(context),
                            style: AppTextStyle.setStyle(
                              color: AppColors.textPrimary,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'can_resend_after'.tr(context),
                            style: AppTextStyle.setStyle(
                              color: AppColors.n500,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Icon(Icons.access_time, size: 14.sp, color: AppColors.n200),
                        ],
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

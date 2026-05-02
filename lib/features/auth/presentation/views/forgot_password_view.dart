import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/routing/routes.dart';
import 'package:madar/core/widgets/custom_auth_button.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController _phoneController = TextEditingController();

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

              // Header Area
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
                      'forgot_password_title'.tr(context),
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
                        'forgot_password_desc'.tr(context),
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

              // Form Container
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '* ' + 'form_phone'.tr(context),
                        style: AppTextStyle.setStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      // Phone Number Field
                      Container(
                        width: 279.w,
                        height: 54.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: AppColors.textFieldBorder),
                        ),
                        child: Row(
                          children: [
                            CountryCodePicker(
                              onChanged: (country) {},
                              initialSelection: 'SA',
                              favorite: const ['+966', 'SA'],
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                              padding: EdgeInsets.zero,
                              textStyle: AppTextStyle.setStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            VerticalDivider(
                                width: 1.w,
                                color: AppColors.textFieldBorder,
                                indent: 10.h,
                                endIndent: 10.h),
                            Expanded(
                              child: TextFormField(
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                textAlign: TextAlign.right,
                                style: AppTextStyle.setStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textPrimary,
                                ),
                                decoration: InputDecoration(
                                  hintText: '(+966) 726-0592',
                                  hintStyle: AppTextStyle.setStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textLight,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 14.w),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      
                      Row(
                        children: [
                          Icon(Icons.info_outline, size: 16.sp, color: AppColors.n200),
                          SizedBox(width: 8.w),
                          Text(
                            'سيتم إرسال رمز التحقق إلى رقم هاتفك.',
                            style: AppTextStyle.setStyle(
                              color: AppColors.n500,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),

                      // Send Button
                      CustomAuthButton(
                        text: 'send_code_btn'.tr(context),
                        onPressed: () {
                          context.push(Routes.kOtpVerificationView);
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

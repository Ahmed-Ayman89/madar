import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/routing/routes.dart';
import 'package:madar/core/widgets/custom_auth_button.dart';
import 'package:madar/core/widgets/custom_text_field.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:intl/intl.dart';
import 'package:madar/core/helper/app_text_style.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

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
                    height: 406.h, // Half of 812h
                    width: double.infinity,
                    child: Image.asset(
                      'assets/photo/background.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: const Color(
                        0xFFFBFBFB,
                      ), // Light background for the bottom
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Icon(Icons.arrow_back, color: AppColors.white),
                        ),
                        Image.asset(
                          'assets/photo/madar_header.png',
                          width: 80.w,
                          height: 30.h,
                        ),
                        SizedBox(width: 48.w), // To balance back button
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'sign_up'.tr(context),
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
                          'already_have_account'.tr(context),
                          style: AppTextStyle.setStyle(
                            color: AppColors.white.withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.push(Routes.kLoginView);
                          },
                          child: Text(
                            'login'.tr(context),
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
                top: 207.h,
                left: 24.w,
                child: Container(
                  width: 327.w,
                  height: 572.h,
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
                      // Full Name
                      CustomTextField(
                        controller: _nameController,
                        hintText: 'full_name'.tr(context),
                        width: 279.w,
                      ),
                      SizedBox(height: 16.h),

                      // Email
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'form_email'.tr(context),
                        keyboardType: TextInputType.emailAddress,
                        width: 279.w,
                      ),
                      SizedBox(height: 16.h),

                      // Birth Date
                      CustomTextField(
                        controller: _dateController,
                        hintText: 'birth_date'.tr(context),
                        width: 279.w,
                        readOnly: true,
                        onTap: () => _selectDate(context),
                        suffixIcon: SvgPicture.asset(
                          'assets/icon/calendar-02.svg',
                          width: 16.w,
                          height: 16.h,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // Phone Number with Country Picker
                      Container(
                        width: 279.w,
                        height: 46.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: AppColors.textFieldBorder,
                            width: 1.w,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.textFieldShadow,
                              blurRadius: 2,
                              offset: Offset(0, 1),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CountryCodePicker(
                              onChanged: (code) {},
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
                              endIndent: 10.h,
                            ),
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
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // Password
                      CustomTextField(
                        controller: _passwordController,
                        hintText: '*******',
                        isPassword: true,
                        width: 279.w,
                        suffixIcon: Icon(
                          Icons.visibility_off_outlined,
                          size: 20.sp,
                          color: AppColors.n200,
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // Register Button
                      CustomAuthButton(
                        text: 'register'.tr(context),
                        onPressed: () {
                          context.push(Routes.kUserTypeView);
                        },
                        width: 279.w,
                      ),
                      SizedBox(height: 16.h),

                      // OR Separator
                      Row(
                        children: [
                          Expanded(child: Divider(color: AppColors.n40)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              'or'.tr(context),
                              style: AppTextStyle.setStyle(
                                color: AppColors.n200,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Expanded(child: Divider(color: AppColors.n40)),
                        ],
                      ),
                      SizedBox(height: 16.h),

                      // Google Sign Up
                      Container(
                        width: 279.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: AppColors.n40),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.textFieldShadow,
                              blurRadius: 2,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             SvgPicture.asset(
                               'assets/icon/google.svg',
                               width: 24.w,
                               height: 24.h,
                             ),
                            SizedBox(width: 8.w),
                            Text(
                              'google_sign_up'.tr(context),
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

                      // Continue as Guest
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'continue_as_guest'.tr(context),
                            style: AppTextStyle.setStyle(
                              color: AppColors.textPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            Icons.person_outline,
                            size: 20.sp,
                            color: AppColors.textPrimary,
                          ),
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

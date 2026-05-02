import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/locale_cubit.dart';

class CustomHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? content;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  const CustomHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.content,
    this.titleStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25.r),
        bottomRight: Radius.circular(25.r),
      ),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/photo/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SECTION 1: Glassy Pill-shaped bar
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(87.r),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        width: 343.w,
                        height: 52.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0x265373DA),
                          borderRadius: BorderRadius.circular(87.r),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.1),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                final currentLocale = context
                                    .read<LocaleCubit>()
                                    .state
                                    .locale;
                                final newLang =
                                    currentLocale.languageCode == 'ar'
                                    ? 'en'
                                    : 'ar';
                                context.read<LocaleCubit>().changeLanguage(
                                  newLang,
                                );
                              },
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.language,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    context
                                                .read<LocaleCubit>()
                                                .state
                                                .locale
                                                .languageCode ==
                                            'ar'
                                        ? 'EN'
                                        : 'AR',
                                    style: AppTextStyle.setWhite(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/photo/madar_header.png',
                              height: 30.h,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),

                // SECTION 2: Typography
                Text(
                  title,
                  style:
                      titleStyle ??
                      AppTextStyle.setWhite(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                SizedBox(height: 16.h),
                Text(
                  subtitle,
                  style:
                      subtitleStyle ??
                      AppTextStyle.setWhite(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),

                // SECTION 3: Dynamic Content
                content ?? const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
    return Container(
      width: double.infinity,
      height: 350.h, // Fixed height to allow overlapping
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/photo/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              // Top Bar: Bell and Location
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Bell Icon
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.notifications_none_rounded,
                      color: Colors.white,
                      size: 24.r,
                    ),
                  ),
                  // Language/Location Selector
                  BlocBuilder<LocaleCubit, LocaleState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          final currentLang = state.locale.languageCode;
                          final newLang = currentLang == 'ar' ? 'en' : 'ar';
                          context.read<LocaleCubit>().changeLanguage(newLang);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                                size: 20.r,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                state.locale.languageCode == 'ar'
                                    ? 'السعودية'
                                    : 'Saudi Arabia',
                                style: AppTextStyle.setWhite(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.white,
                                size: 18.r,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              // Typography
              Text(
                title,
                style:
                    titleStyle ??
                    AppTextStyle.setWhite(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              Text(
                subtitle,
                style:
                    subtitleStyle ??
                    AppTextStyle.setWhite(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                textAlign: TextAlign.center,
              ),
              if (content != null) ...[SizedBox(height: 20.h), content!],
            ],
          ),
        ),
      ),
    );
  }
}

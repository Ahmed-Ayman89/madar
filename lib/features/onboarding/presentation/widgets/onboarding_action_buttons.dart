import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';

class OnboardingActionButtons extends StatelessWidget {
  final int currentIndex;
  final int itemCount;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  const OnboardingActionButtons({
    super.key,
    required this.currentIndex,
    required this.itemCount,
    required this.onSkip,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    bool isLastPage = currentIndex == itemCount - 1;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!isLastPage)
            TextButton(
              onPressed: onSkip,
              child: Text(
                'skip'.tr(context),
                style: AppTextStyle.bodyRegular.copyWith(
                  color: Colors.white70,
                ),
              ),
            )
          else
            const SizedBox.shrink(),
          ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: isLastPage ? 50.w : 40.w,
                vertical: 15.h,
              ),
              backgroundColor: AppColors.primary500,
              foregroundColor: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              isLastPage ? 'start_now'.tr(context) : 'next'.tr(context),
              style: AppTextStyle.button,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madar/features/main/presentation/cubit/main_nav_cubit.dart';

class ServicesHeader extends StatelessWidget {
  const ServicesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Main Header
            Expanded(
              child: Text(
                'services_main_title'.tr(context),
                style: AppTextStyle.setStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            // Show All Button
            GestureDetector(
              onTap: () {
                context.read<MainNavCubit>().changeIndex(1); // Index 1 is Services
              },
              child: Text(
                'عرض الكل', // Can be localized
                style: AppTextStyle.setStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF259CCB),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madar/features/main/presentation/cubit/main_nav_cubit.dart';

class OurWorkHeader extends StatelessWidget {
  const OurWorkHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Main Header
            Text(
              'أحدث أعمالنا', // Can be localized
              style: AppTextStyle.setStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            // Show All Button
            GestureDetector(
              onTap: () {
                context.read<MainNavCubit>().changeIndex(
                  2,
                ); // Index 2 is Projects
              },
              child: Text(
                'عرض الكل',
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

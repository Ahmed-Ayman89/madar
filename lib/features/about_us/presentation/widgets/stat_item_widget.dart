import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';

class StatItemWidget extends StatelessWidget {
  final String number;
  final String title;
  final String description;

  const StatItemWidget({
    super.key,
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          number,
          style: AppTextStyle.setStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF259CCB),
          ),
          textDirection: TextDirection.ltr, // Keep numbers LTR
        ),
        SizedBox(height: 4.h),
        Text(
          title,
          style: AppTextStyle.setStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4.h),
        Text(
          description,
          style: AppTextStyle.setStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ).copyWith(height: 1.5),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

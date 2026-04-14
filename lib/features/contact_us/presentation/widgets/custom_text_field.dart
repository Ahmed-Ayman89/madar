import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF283A64), // Slightly lighter than the form bg
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        style: AppTextStyle.setWhite(fontSize: 12, fontWeight: FontWeight.w400),
        // textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: maxLines > 1 ? 16.h : 0,
          ),
          hintText: hintText,
          hintStyle: AppTextStyle.setWhite(
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ).copyWith(color: Colors.white),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}

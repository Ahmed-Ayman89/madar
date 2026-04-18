import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';

class BlogContentSection extends StatelessWidget {
  final String content;
  const BlogContentSection({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildParagraph(content)],
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: AppTextStyle.setStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ).copyWith(height: 1.8),
    );
  }
}

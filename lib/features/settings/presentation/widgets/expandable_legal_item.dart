import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';

class ExpandableLegalItem extends StatefulWidget {
  final String title;
  final String content;
  final bool initiallyExpanded;

  const ExpandableLegalItem({
    super.key,
    required this.title,
    required this.content,
    this.initiallyExpanded = false,
  });

  @override
  State<ExpandableLegalItem> createState() => _ExpandableLegalItemState();
}

class _ExpandableLegalItemState extends State<ExpandableLegalItem> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFF3F4F6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => setState(() => isExpanded = !isExpanded),
            borderRadius: BorderRadius.circular(12.r),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  Icon(
                    isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: const Color(0xFF182D62),
                    size: 24.r,
                  ),
                  const Spacer(),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: AppTextStyle.setStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF182D62),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
              child: Text(
                widget.content,
                style: AppTextStyle.setStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.n400,
                ).copyWith(height: 1.6),
                textAlign: TextAlign.right,
              ),
            ),
        ],
      ),
    );
  }
}

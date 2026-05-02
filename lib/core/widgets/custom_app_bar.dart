import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool canPop = Navigator.canPop(context);

    return Container(
      height: 111.h,
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 16.h,
        left: 16.w,
        right: 16.w,
      ),
      decoration: const BoxDecoration(
        color: AppColors.darkBlue,
      ),
      child: SafeArea(
        child: Row(
          children: [
            if (showBackButton && canPop) ...[
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 18.r,
                  ),
                ),
              ),
              SizedBox(width: 16.w), // The gap specified in CSS
            ],
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.setWhite(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (actions != null) ...actions!,
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(111.h);
}

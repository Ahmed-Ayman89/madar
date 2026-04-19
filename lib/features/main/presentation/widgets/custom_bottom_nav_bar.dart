import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'nav_bar_painter.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double w = constraints.maxWidth;
        double itemWidth = w / 5;
        final bool isRtl = Directionality.of(context) == TextDirection.rtl;
        double targetX = isRtl
            ? w - ((widget.selectedIndex + 0.5) * itemWidth)
            : (widget.selectedIndex + 0.5) * itemWidth;

        return Container(
          height: 100.h,
          color: Colors.transparent,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween<double>(end: targetX),
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutCubic,
                builder: (context, xPos, child) {
                  return CustomPaint(
                    size: Size(w, 100.h),
                    painter: NavBarPainter(
                      backgroundColor: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          const Color(0xFF0E1A39),
                          const Color(0xFF0E1A39),
                          const Color(0xFF182D62),
                        ],
                      ),
                      xCenter: xPos,
                    ),
                  );
                },
              ),
              // Navigation Items Row (Directionality handled by MaterialApp)
              Positioned(
                bottom: 12.h,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    _buildItem(
                      0,
                      'nav_home'.tr(context),
                      'assets/icon/home.svg',
                    ),
                    _buildItem(
                      1,
                      'nav_services'.tr(context),
                      'assets/icon/service.svg',
                    ),
                    _buildItem(
                      2,
                      'nav_our_work'.tr(context),
                      'assets/icon/work.svg',
                    ),
                    _buildItem(
                      3,
                      'nav_contact_us'.tr(context),
                      'assets/icon/notification.svg',
                    ),
                    _buildItem(
                      4,
                      'nav_more'.tr(context),
                      'assets/icon/building.svg',
                    ), // Placeholder icon for 'More'
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItem(int index, String label, String iconPath) {
    bool isSelected = widget.selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => widget.onItemSelected(index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon jumps into the scoop area when selected
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: 50.w,
              height: 50.h,
              margin: EdgeInsets.only(bottom: isSelected ? 50.h : 0),
              alignment: Alignment.center,
              decoration: isSelected
                  ? const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF182D62), Color(0xFF0E1A39)],
                      ),
                    )
                  : null,
              child: SvgPicture.asset(
                iconPath,
                width: 24.w,
                height: 24.w,
                colorFilter: ColorFilter.mode(
                  isSelected ? Colors.white : AppColors.n300,
                  BlendMode.srcIn,
                ),
              ),
            ),

            SizedBox(height: isSelected ? 3 : 5.h),
            Text(
              label,
              style: AppTextStyle.caption.copyWith(
                color: isSelected ? Colors.white : AppColors.n300,
                fontSize: 10.sp,
                height: 1.0,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

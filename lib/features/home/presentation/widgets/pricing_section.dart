import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/features/packages/presentation/cubit/packages_cubit.dart';
import 'package:madar/features/packages/presentation/cubit/packages_state.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/routes.dart';
import 'package:madar/features/packages/presentation/widgets/pricing_card_widget.dart';

class PricingSection extends StatefulWidget {
  const PricingSection({super.key});

  @override
  State<PricingSection> createState() => _PricingSectionState();
}

class _PricingSectionState extends State<PricingSection> {
  bool isYearly = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Text(
            'اختر الباقة المناسبة لنمو أعمالك',
            style: AppTextStyle.setStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            'اختر من بين باقاتنا المصممة لتجمع بين الحلول التقنية والتسويق الرقمي، بما يساعدك على بناء حضور قوي وتحقيق أهدافك بسهولة.',
            style: AppTextStyle.setStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.n400,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),

          // Toggle
          Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildToggleButton('شهرياً', !isYearly),
                _buildToggleButton('سنوياً', isYearly),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          BlocBuilder<PackagesCubit, PackagesState>(
            builder: (context, state) {
              if (state is PackagesLoading) {
                return SizedBox(
                  height: 220.h,
                  child: const Center(
                    child: CircularProgressIndicator(color: Color(0xFF259CCB)),
                  ),
                );
              } else if (state is PackagesError) {
                return SizedBox(
                  height: 220.h,
                  child: Center(child: Text(state.message)),
                );
              } else if (state is PackagesLoaded) {
                if (state.packages.isEmpty) {
                  return SizedBox(
                    height: 220.h,
                    child: const Center(child: Text('No packages found')),
                  );
                }
                return Column(
                  children: [
                    SizedBox(
                      height: 235.h, // Slightly more for shadow
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        itemCount: state.packages.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 16.w),
                        itemBuilder: (context, index) {
                          return PricingCardWidget(
                            package: state.packages[index],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Indicators
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        state.packages.length.clamp(0, 3),
                        (index) => Container(
                          width: index == 0 ? 24.w : 12.w,
                          height: 4.h,
                          margin: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(
                            color: index == 0
                                ? const Color(0xFF182D62)
                                : const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),

          SizedBox(height: 24.h),

          // Show All Button
          GestureDetector(
            onTap: () {
              context.push(Routes.kPackagesView);
            },
            child: Center(
              child: Container(
                width: 150.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: const Color(0xFF259CCB)),
                ),
                child: Center(
                  child: Text(
                    'عرض الكل',
                    style: AppTextStyle.setStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF259CCB),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String text, bool selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isYearly = (text == 'سنوياً');
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          text,
          style: AppTextStyle.setStyle(
            fontSize: 14,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            color: selected ? AppColors.bgBlue900 : AppColors.n400,
          ),
        ),
      ),
    );
  }
}

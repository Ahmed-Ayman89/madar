import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/features/projects/presentation/cubit/project_cubit.dart';
import 'package:madar/features/projects/presentation/cubit/project_state.dart';
import 'our_work_header.dart';
import 'work_project_card.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madar/features/main/presentation/cubit/main_nav_cubit.dart';

class OurWorkSection extends StatelessWidget {
  const OurWorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          const OurWorkHeader(),
          SizedBox(height: 24.h),
          BlocBuilder<ProjectCubit, ProjectState>(
            builder: (context, state) {
              if (state is ProjectLoading || state is ProjectInitial) {
                return SizedBox(
                  height: 153.h,
                  child: const Center(
                    child: CircularProgressIndicator(color: Color(0xFF259CCB)),
                  ),
                );
              } else if (state is ProjectError) {
                return SizedBox(
                  height: 153.h,
                  child: Center(
                    child: Text(
                      state.message,
                      style: AppTextStyle.setStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              } else if (state is ProjectLoaded) {
                if (state.projects.isEmpty) {
                  return SizedBox(
                    height: 153.h,
                    child: const Center(child: Text('No projects available')),
                  );
                }
                // Only show the first (one) project for home as requested
                final featuredProject = state.projects.first;
                return WorkProjectCard(project: featuredProject);
              }
              return const SizedBox.shrink();
            },
          ),
          SizedBox(height: 30.h),
          // Show All Button
          Center(
            child: SizedBox(
              width: 120.w,
              height: 33.h,
              child: ElevatedButton(
                onPressed: () {
                  // Switch to Projects Tab (Index 2)
                  context.read<MainNavCubit>().changeIndex(2);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF259CCB),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(68.r),
                  ),
                  elevation: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'show_all'.tr(context),
                      style: AppTextStyle.setStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Directionality.of(context) == TextDirection.rtl
                          ? Icons.arrow_forward_ios
                          : Icons.arrow_back_ios,
                      size: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

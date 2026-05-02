import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/features/projects/presentation/cubit/project_cubit.dart';
import 'package:madar/features/projects/presentation/cubit/project_state.dart';
import 'our_work_header.dart';
import 'work_project_card.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

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
                  height: 332.h,
                  child: const Center(
                    child: CircularProgressIndicator(color: Color(0xFF259CCB)),
                  ),
                );
              } else if (state is ProjectError) {
                return SizedBox(
                  height: 332.h,
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
                    height: 332.h,
                    child: const Center(child: Text('No projects available')),
                  );
                }
                return SizedBox(
                  height: 345.h, // Slightly more for shadow
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    itemCount: state.projects.length,
                    separatorBuilder: (context, index) => SizedBox(width: 16.w),
                    itemBuilder: (context, index) {
                      return WorkProjectCard(project: state.projects[index]);
                    },
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}

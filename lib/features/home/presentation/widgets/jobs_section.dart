import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/features/careers/presentation/cubit/job_cubit.dart';
import 'package:madar/features/careers/presentation/cubit/job_state.dart';
import 'package:go_router/go_router.dart';
import 'package:madar/core/routing/routes.dart';
import 'job_carousel_card.dart';

class JobsSection extends StatelessWidget {
  const JobsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الوظائف المتاحة',
                style: AppTextStyle.setStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.push(Routes.kCareersView);
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
          SizedBox(height: 24.h),
          BlocBuilder<JobCubit, JobState>(
            builder: (context, state) {
              if (state is JobLoading || state is JobInitial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is JobError) {
                return Center(child: Text(state.message));
              } else if (state is JobsLoaded) {
                if (state.jobs.isEmpty) {
                  return const Center(
                    child: Text('لا توجد وظائف متاحة حالياً'),
                  );
                }
                return SizedBox(
                  height: 195.h, // Slightly more for shadow
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    itemCount: state.jobs.length,
                    separatorBuilder: (context, index) => SizedBox(width: 16.w),
                    itemBuilder: (context, index) {
                      return JobCarouselCard(job: state.jobs[index]);
                    },
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

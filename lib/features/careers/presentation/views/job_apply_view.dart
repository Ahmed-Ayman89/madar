import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/network/api_helper.dart';
import 'package:madar/features/careers/data/data_sources/job_remote_data_source.dart';
import 'package:madar/features/careers/data/repositories/job_repository_impl.dart';
import 'package:madar/features/careers/domain/entities/job_entity.dart';
import 'package:madar/features/careers/presentation/cubit/job_apply_cubit.dart';

// Modular Widgets
import '../widgets/job_apply/job_apply_form.dart';
import '../widgets/job_apply/job_summary_header.dart';

class JobApplyView extends StatelessWidget {
  final JobEntity job;
  const JobApplyView({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobApplyCubit(
        JobRepositoryImpl(JobRemoteDataSource(APIHelper())),
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              JobSummaryHeader(job: job),
              Padding(
                padding: EdgeInsets.all(24.w),
                child: JobApplyForm(job: job),
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}

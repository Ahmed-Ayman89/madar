import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/localization/locale_cubit.dart';
import 'package:madar/core/widgets/custom_header_widget.dart';
import 'package:madar/core/network/api_helper.dart';
import '../cubit/job_cubit.dart';
import '../cubit/job_state.dart';
import '../../data/data_sources/job_remote_data_source.dart';
import '../../data/repositories/job_repository_impl.dart';
import '../../domain/entities/job_entity.dart';

class JobDetailsView extends StatelessWidget {
  final String jobId;
  const JobDetailsView({super.key, required this.jobId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final lang = context.read<LocaleCubit>().state.locale.languageCode;
        return JobCubit(
          JobRepositoryImpl(JobRemoteDataSource(APIHelper())),
        )..getJobDetails(jobId, lang: lang);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<JobCubit, JobState>(
          builder: (context, state) {
            if (state is JobLoading || state is JobInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is JobError) {
              return Center(child: Text(state.message));
            } else if (state is JobDetailLoaded) {
              final job = state.job;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context, job),
                    Padding(
                      padding: EdgeInsets.all(24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionTitle(context, 'description'),
                          SizedBox(height: 12.h),
                          Text(
                            job.description,
                            style: AppTextStyle.setStyle(
                              fontSize: 14,
                              color: AppColors.n700,
                              fontWeight: FontWeight.w400,
                            ).copyWith(height: 1.6),
                          ),
                          SizedBox(height: 30.h),
                          _buildSectionTitle(context, 'requirements'),
                          SizedBox(height: 12.h),
                          _buildListItems(job.requirements),
                          SizedBox(height: 30.h),
                          _buildSectionTitle(context, 'responsibilities'),
                          SizedBox(height: 12.h),
                          _buildListItems(job.responsibilities),
                          SizedBox(height: 50.h),
                          _buildApplyButton(context),
                          SizedBox(height: 50.h),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, JobEntity job) {
    return CustomHeaderWidget(
      title: job.title,
      titleStyle: AppTextStyle.setWhite(
        fontSize: 22,
        fontWeight: FontWeight.w800,
      ),
      subtitle: '${job.type} • ${job.location}',
      subtitleStyle: AppTextStyle.setStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF259CCB),
      ),
      content: Padding(
        padding: EdgeInsets.only(bottom: 40.h),
        child: Text(
          '${'salary_range'.tr(context)}: ${job.salaryRange}',
          style: AppTextStyle.setWhite(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String key) {
    return Text(
      key.tr(context),
      style: AppTextStyle.setStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }

  Widget _buildListItems(String content) {
    final items = content.split('.').where((s) => s.trim().isNotEmpty).toList();
    return Column(
      children: items.map((item) {
        return Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFF259CCB),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  item.trim(),
                  style: AppTextStyle.setStyle(
                    fontSize: 14,
                    color: AppColors.n700,
                    fontWeight: FontWeight.w400,
                  ).copyWith(height: 1.5),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildApplyButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF259CCB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          'apply_now'.tr(context),
          style: AppTextStyle.setWhite(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

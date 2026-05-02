import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/localization/locale_cubit.dart';
import 'package:madar/core/widgets/custom_app_bar.dart';
import 'package:madar/core/network/api_helper.dart';
import '../widgets/team_card_widget.dart';
import '../widgets/job_card_widget.dart';
import '../widgets/filter_dropdown_widget.dart';
import '../cubit/job_cubit.dart';
import '../cubit/job_state.dart';
import '../cubit/team_cubit.dart';
import '../cubit/team_state.dart';
import '../../data/data_sources/job_remote_data_source.dart';
import '../../data/repositories/job_repository_impl.dart';
import '../../data/data_sources/team_remote_data_source.dart';
import '../../data/repositories/team_repository_impl.dart';

class CareersView extends StatelessWidget {
  const CareersView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final lang = context.read<LocaleCubit>().state.locale.languageCode;
            return JobCubit(
              JobRepositoryImpl(JobRemoteDataSource(APIHelper())),
            )..getJobs(lang: lang);
          },
        ),
        BlocProvider(
          create: (context) {
            final lang = context.read<LocaleCubit>().state.locale.languageCode;
            return TeamCubit(
              TeamRepositoryImpl(TeamRemoteDataSource(APIHelper())),
            )..getTeamMembers(lang: lang);
          },
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'team_title'.tr(context),
        ),
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24.h),
              // Category/Subtitle
              Text(
                'team_category'.tr(context),
                style: AppTextStyle.setStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF259CCB),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              // Description
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  'team_description'.tr(context),
                  style: AppTextStyle.setStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.6),
                  ).copyWith(height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30.h),
              
              // Team Members Horizontal List
              BlocBuilder<TeamCubit, TeamState>(
                builder: (context, state) {
                  if (state is TeamLoading) {
                    return SizedBox(
                      height: 250.h,
                      child: const Center(child: CircularProgressIndicator(color: Color(0xFF259CCB))),
                    );
                  } else if (state is TeamError) {
                    return SizedBox(
                      height: 250.h,
                      child: Center(child: Text(state.message)),
                    );
                  } else if (state is TeamSuccess) {
                    if (state.members.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return SizedBox(
                      height: 250.h,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.members.length,
                        separatorBuilder: (context, index) => SizedBox(width: 16.w),
                        itemBuilder: (context, index) {
                          final member = state.members[index];
                          final isArabic = Localizations.localeOf(context).languageCode == 'ar';
                          final displayTitle = (isArabic && member.jobTitleAr.isNotEmpty) 
                              ? member.jobTitleAr 
                              : member.jobTitle;

                          return TeamCardWidget(
                            name: member.name,
                            title: displayTitle,
                            imageUrl: member.image,
                          );
                        },
                      ),
                    );
                  }
                  return SizedBox(height: 250.h);
                },
              ),
              SizedBox(height: 30.h),

              // SECTION 2: Join Our Team
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'join_team_title'.tr(context),
                      style: AppTextStyle.setStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        'join_team_desc'.tr(context),
                        style: AppTextStyle.setStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ).copyWith(height: 1.6),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 30.h),

                    // Filters Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilterDropdownWidget(text: 'filter_on_site'.tr(context)),
                        FilterDropdownWidget(text: 'filter_all_teams'.tr(context)),
                        FilterDropdownWidget(text: 'filter_full_time'.tr(context)),
                      ],
                    ),
                    SizedBox(height: 30.h),

                    // Job Listing
                    BlocBuilder<JobCubit, JobState>(
                      builder: (context, state) {
                        return _buildJobListing(context, state);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJobListing(BuildContext context, JobState state) {
    if (state is JobLoading || state is JobInitial) {
      return SizedBox(
        height: 100.h,
        child: const Center(child: CircularProgressIndicator()),
      );
    } else if (state is JobError) {
      return Center(child: Text(state.message));
    } else if (state is JobsLoaded) {
      if (state.jobs.isEmpty) {
        return Center(child: Text('no_jobs_found'.tr(context)));
      }
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: state.jobs.length,
        itemBuilder: (context, index) {
          return JobCardWidget(job: state.jobs[index]);
        },
      );
    }
    return const SizedBox.shrink();
  }
}

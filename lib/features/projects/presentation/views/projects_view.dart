import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/localization/locale_cubit.dart';
import 'package:madar/core/widgets/custom_app_bar.dart';
import 'package:madar/core/network/api_helper.dart';

import '../widgets/project_card_widget.dart';
import '../cubit/project_cubit.dart';
import '../cubit/project_state.dart';
import '../../data/data_sources/project_remote_data_source.dart';
import '../../data/repositories/project_repository_impl.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final lang = context.read<LocaleCubit>().state.locale.languageCode;
        return ProjectCubit(
          ProjectRepositoryImpl(ProjectRemoteDataSource(APIHelper())),
        )..getProjects(lang: lang);
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'projects_latest_title'.tr(context),
          showBackButton: false,
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<ProjectCubit, ProjectState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  // WhatsApp Banner
                  Container(
                    width: 343.w,
                    height: 86.h,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4FAACE), Color(0xFF369EC9)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'هل لديك فكرة مشروع؟',
                              style: AppTextStyle.setStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'تواصل معنا عبر واتساب',
                              style: AppTextStyle.setStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 12.w),
                        const Icon(
                          Icons.abc_outlined,
                          color: Colors.white,
                          size: 32,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // Section Title
                  Text(
                    'معرض مشاريعنا المميزة',
                    style: AppTextStyle.setStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF182D62),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // Project Content Based on State
                  _buildProjectContent(context, state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProjectContent(BuildContext context, ProjectState state) {
    if (state is ProjectLoading || state is ProjectInitial) {
      return SizedBox(
        height: 200.h,
        child: const Center(
          child: CircularProgressIndicator(color: Color(0xFF259CCB)),
        ),
      );
    } else if (state is ProjectError) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            SizedBox(height: 16.h),
            Text(
              state.message,
              style: AppTextStyle.setStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () => context.read<ProjectCubit>().getProjects(
                lang: context.read<LocaleCubit>().state.locale.languageCode,
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    } else if (state is ProjectLoaded) {
      if (state.projects.isEmpty) {
        return Center(child: Text('no_projects_found'.tr(context)));
      }
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.projects.length,
          itemBuilder: (context, index) {
            return ProjectCardWidget(project: state.projects[index]);
          },
        ),
      );
    }
    return const SizedBox.shrink();
  }
}

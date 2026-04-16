import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/localization/locale_cubit.dart';
import 'package:madar/core/widgets/CustomElevatedButton_widget.dart';
import 'package:madar/core/widgets/custom_header_widget.dart';
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
        backgroundColor: Colors.white,
        body: BlocBuilder<ProjectCubit, ProjectState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  CustomHeaderWidget(
                    title: 'projects_header_category'.tr(context),
                    titleStyle: AppTextStyle.setStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF259CCB),
                    ),
                    subtitle: 'projects_header_subtitle'.tr(context),
                    subtitleStyle: AppTextStyle.setWhite(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                    ),
                    content: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Text(
                            'projects_header_description'.tr(context),
                            style: AppTextStyle.setWhite(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ).copyWith(
                              color: Colors.white.withOpacity(0.85),
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 35.h),
                        CustomElevatedButton(
                          text: 'projects_header_button'.tr(context),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),

                  // SECTION: Latest Projects
                  SizedBox(height: 50.h),
                  Column(
                    children: [
                      Text(
                        'projects_latest_title'.tr(context),
                        style: AppTextStyle.setStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          'projects_latest_description'.tr(context),
                          style: AppTextStyle.setStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.6),
                          ).copyWith(height: 1.5),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 40.h),

                      // Project Content Based on State
                      _buildProjectContent(context, state),
                    ],
                  ),
                  SizedBox(height: 100.h),
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
        return Center(
          child: Text('no_projects_found'.tr(context)),
        );
      }
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.projects.length,
          itemBuilder: (context, index) {
            return ProjectCardWidget(
              project: state.projects[index],
            );
          },
        ),
      );
    }
    return const SizedBox.shrink();
  }
}

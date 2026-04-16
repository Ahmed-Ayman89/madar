import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/widgets/custom_network_image.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/localization/locale_cubit.dart';
import 'package:madar/core/network/api_helper.dart';
import '../../data/data_sources/project_remote_data_source.dart';
import '../../data/repositories/project_repository_impl.dart';
import '../cubit/project_details_cubit.dart';
import '../cubit/project_details_state.dart';

class ProjectDetailsView extends StatelessWidget {
  final String projectId;

  const ProjectDetailsView({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final lang = context.read<LocaleCubit>().state.locale.languageCode;
        return ProjectDetailsCubit(
          ProjectRepositoryImpl(ProjectRemoteDataSource(APIHelper())),
        )..getProjectDetails(projectId, lang: lang);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<ProjectDetailsCubit, ProjectDetailsState>(
          builder: (context, state) {
            if (state is ProjectDetailsLoading || state is ProjectDetailsInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProjectDetailsError) {
              return Center(child: Text(state.message));
            } else if (state is ProjectDetailsLoaded) {
              final project = state.project;
              return CustomScrollView(
                slivers: [
                  // App Bar with Hero Image
                  SliverAppBar(
                    expandedHeight: 300.h,
                    pinned: true,
                    backgroundColor: const Color(0xFF182D62),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Hero(
                        tag: project.id,
                        child: CustomNetworkImage(
                          imageUrl: project.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  // Project Content
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Logo & Category
                          Row(
                            children: [
                              if (project.logoUrl != null)
                                SizedBox(
                                  width: 80.w,
                                  height: 40.h,
                                  child: CustomNetworkImage(
                                    imageUrl: project.logoUrl!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              const Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF259CCB).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Text(
                                  project.category,
                                  style: AppTextStyle.setStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF259CCB),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),

                          // Title
                          Text(
                            project.title,
                            style: AppTextStyle.setStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF182D62),
                            ),
                          ),
                          SizedBox(height: 16.h),

                          // Technologies
                          Wrap(
                            spacing: 8.w,
                            runSpacing: 8.h,
                            children: project.technologies.map((tech) {
                              return Chip(
                                label: Text(
                                  tech,
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                                backgroundColor: Colors.grey[100],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 30.h),

                          // Description Section
                          Text(
                            'project_description_label'.tr(context),
                            style: AppTextStyle.setStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            project.description,
                            style: AppTextStyle.setStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ).copyWith(height: 1.6),
                          ),
                          
                          SizedBox(height: 40.h),
                          
                          // Action Button
                          if (project.link != null && project.link!.isNotEmpty)
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Open project link
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF182D62),
                                  padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                ),
                                child: Text(
                                  'visit_project'.tr(context),
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          
                          SizedBox(height: 100.h),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

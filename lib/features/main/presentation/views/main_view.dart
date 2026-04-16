import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/localization/locale_cubit.dart';
import 'package:madar/core/network/api_helper.dart';
import 'package:madar/core/widgets/CustomElevatedButton_widget.dart';
import 'package:madar/core/widgets/custom_header_widget.dart';
import 'package:madar/features/home/presentation/widgets/services_section.dart';
import 'package:madar/features/home/presentation/widgets/about_us_section.dart';
import 'package:madar/features/home/presentation/widgets/our_work_section.dart';
import 'package:madar/features/home/presentation/widgets/latest_articles_section.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/features/main/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:madar/features/projects/data/data_sources/project_remote_data_source.dart';
import 'package:madar/features/projects/data/repositories/project_repository_impl.dart';
import 'package:madar/features/projects/presentation/cubit/project_cubit.dart';
import 'package:madar/features/services/data/data_sources/services_remote_data_source.dart';
import 'package:madar/features/services/data/repositories/services_repository_impl.dart';
import 'package:madar/features/services/presentation/cubit/services_cubit.dart';
import 'package:madar/features/services/presentation/views/services_view.dart';
import 'package:madar/features/projects/presentation/views/projects_view.dart';
import 'package:madar/features/contact_us/presentation/views/contact_us_view.dart';
import 'package:madar/features/more/presentation/views/more_view.dart';
import 'package:madar/features/blogs/data/data_sources/blog_remote_data_source.dart';
import 'package:madar/features/blogs/data/repositories/blog_repository_impl.dart';
import 'package:madar/features/blogs/presentation/cubit/blog_cubit.dart';

import 'package:madar/features/main/presentation/cubit/main_nav_cubit.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainNavCubit(),
      child: BlocBuilder<MainNavCubit, int>(
        builder: (context, selectedIndex) {
          final List<Widget> pages = [
            const HomeTab(),
            const ServicesView(),
            const ProjectsView(),
            const ContactUsView(),
            const MoreView(),
          ];

          return Scaffold(
            extendBody: true,
            backgroundColor: AppColors.white,
            body: IndexedStack(index: selectedIndex, children: pages),
            bottomNavigationBar: CustomBottomNavBar(
              selectedIndex: selectedIndex,
              onItemSelected: (index) {
                context.read<MainNavCubit>().changeIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomHeaderWidget(
            title: 'header_title'.tr(context),
            subtitle: 'header_subtitle'.tr(context),
            content: CustomElevatedButton(
              text: 'contact_us'.tr(context),
              onPressed: () {},
            ),
          ),
          SizedBox(height: 40.h),
          BlocProvider(
            create: (context) {
              final lang = context
                  .read<LocaleCubit>()
                  .state
                  .locale
                  .languageCode;
              return ServicesCubit(
                ServicesRepositoryImpl(ServicesRemoteDataSource(APIHelper())),
              )..getServices(lang: lang);
            },
            child: const ServicesSection(),
          ),
          const AboutUsSection(),
          SizedBox(height: 40.h),
          BlocProvider(
            create: (context) {
              final lang = context
                  .read<LocaleCubit>()
                  .state
                  .locale
                  .languageCode;
              return ProjectCubit(
                ProjectRepositoryImpl(ProjectRemoteDataSource(APIHelper())),
              )..getProjects(lang: lang);
            },
            child: const OurWorkSection(),
          ),
          SizedBox(height: 40.h),
          BlocProvider(
            create: (context) {
              final lang = context
                  .read<LocaleCubit>()
                  .state
                  .locale
                  .languageCode;
              return BlogCubit(
                BlogRepositoryImpl(BlogRemoteDataSource(APIHelper())),
              )..getBlogs(lang: lang);
            },
            child: const LatestArticlesSection(),
          ),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }
}

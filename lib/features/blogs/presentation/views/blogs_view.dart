import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/localization/locale_cubit.dart';
import 'package:madar/core/widgets/custom_header_widget.dart';
import 'package:madar/core/network/api_helper.dart';
import 'package:madar/features/contact_us/presentation/views/contact_us_view.dart';

import '../widgets/blog_intro_section.dart';
import '../widgets/blog_search_filter.dart';
import '../widgets/article_list_item_card.dart';
import '../cubit/blog_cubit.dart';
import '../cubit/blog_state.dart';
import '../../data/data_sources/blog_remote_data_source.dart';
import '../../data/repositories/blog_repository_impl.dart';

class BlogsView extends StatelessWidget {
  const BlogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final lang = context.read<LocaleCubit>().state.locale.languageCode;
        return BlogCubit(
          BlogRepositoryImpl(BlogRemoteDataSource(APIHelper())),
        )..getBlogs(lang: lang);
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: BlocBuilder<BlogCubit, BlogState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  // SECTION 1: Header
                  CustomHeaderWidget(
                    title: 'blog_header_title'.tr(context),
                    titleStyle: AppTextStyle.setWhite(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                    subtitle: 'blog_header_subtitle'.tr(context),
                    subtitleStyle: AppTextStyle.setStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF259CCB),
                    ),
                    content: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Text(
                            'blog_header_desc'.tr(context),
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
                        SizedBox(height: 30.h),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ContactUsView(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF259CCB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 30.w,
                              vertical: 12.h,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.arrow_back_ios,
                                size: 14,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'blog_contact_us'.tr(context),
                                style: AppTextStyle.setWhite(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),

                  // SECTION 2: Blog Intro
                  const BlogIntroSection(),

                  // SECTION 3: Search & Filter
                  const BlogSearchFilter(),

                  // SECTION 4: Articles List
                  _buildBlogContent(context, state),

                  SizedBox(height: 50.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBlogContent(BuildContext context, BlogState state) {
    if (state is BlogLoading || state is BlogInitial) {
      return SizedBox(
        height: 200.h,
        child: const Center(
          child: CircularProgressIndicator(color: Color(0xFF259CCB)),
        ),
      );
    } else if (state is BlogError) {
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
              onPressed: () => context.read<BlogCubit>().getBlogs(
                    lang: context.read<LocaleCubit>().state.locale.languageCode,
                  ),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    } else if (state is BlogsLoaded) {
      if (state.blogs.isEmpty) {
        return Center(
          child: Text('no_blogs_found'.tr(context)),
        );
      }
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: state.blogs.length,
        separatorBuilder: (context, index) => SizedBox(height: 10.h),
        itemBuilder: (context, index) {
          return ArticleListItemCard(blog: state.blogs[index]);
        },
      );
    }
    return const SizedBox.shrink();
  }
}

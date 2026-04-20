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
import '../widgets/featured_article_card.dart';
import '../widgets/blog_content_section.dart';
import '../widgets/related_articles_slider.dart';
import '../widgets/latest_news_list.dart';
import '../widgets/blog_topics_section.dart';
import '../cubit/blog_cubit.dart';
import '../cubit/blog_state.dart';
import '../../data/data_sources/blog_remote_data_source.dart';
import '../../data/repositories/blog_repository_impl.dart';

class BlogDetailsView extends StatelessWidget {
  final String blogId;
  const BlogDetailsView({super.key, required this.blogId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final lang = context.read<LocaleCubit>().state.locale.languageCode;
        return BlogCubit(
          BlogRepositoryImpl(BlogRemoteDataSource(APIHelper())),
        )..getBlogDetails(blogId, lang: lang);
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: const Color(0xFF14244B),
          elevation: 0,
          leading: const BackButton(color: Colors.white),
        ),
        body: BlocBuilder<BlogCubit, BlogState>(
          builder: (context, state) {
            if (state is BlogLoading || state is BlogInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BlogError) {
              return Center(child: Text(state.message));
            } else if (state is BlogDetailLoaded) {
              final blog = state.blog;
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

                    // SECTION 3: Featured Article
                    FeaturedArticleCard(blog: blog),

                    // SECTION 4: Detailed Content
                    BlogContentSection(content: blog.content ?? ""),

                    // SECTION 5: Related Articles
                    RelatedArticlesSlider(
                      articles: blog.relatedBlogs ?? [],
                    ),

                    // SECTION 6: Blog Topics
                    BlogTopicsSection(
                      tags: (context.read<LocaleCubit>().state.locale.languageCode == 'ar' 
                          ? blog.tagsAr ?? blog.tags 
                          : blog.tags) ?? [],
                    ),

                    SizedBox(height: 30.h),

                    // SECTION 7: Latest News
                    LatestNewsList(
                      news: blog.latestNews ?? [],
                    ),

                    SizedBox(height: 100.h),
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
}

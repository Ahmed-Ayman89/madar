import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'article_card.dart';
import '../../../blogs/presentation/cubit/blog_cubit.dart';
import '../../../blogs/presentation/cubit/blog_state.dart';
import '../../../blogs/presentation/views/blogs_view.dart';

class LatestArticlesSection extends StatefulWidget {
  const LatestArticlesSection({super.key});

  @override
  State<LatestArticlesSection> createState() => _LatestArticlesSectionState();
}

class _LatestArticlesSectionState extends State<LatestArticlesSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'أحدث المقالات',
                style: AppTextStyle.setStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const BlogsView()),
                  );
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
        ),
        SizedBox(height: 24.h),

        // Carousel with Arrows
        BlocBuilder<BlogCubit, BlogState>(
          builder: (context, state) {
            if (state is BlogLoading || state is BlogInitial) {
              return SizedBox(
                height: 350.h,
                child: const Center(child: CircularProgressIndicator()),
              );
            } else if (state is BlogError) {
              return SizedBox(
                height: 350.h,
                child: Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            } else if (state is BlogsLoaded) {
              final blogsState = state;
              if (blogsState.blogs.isEmpty) {
                return SizedBox(
                  height: 350.h,
                  child: Center(child: Text('no_blogs_found'.tr(context))),
                );
              }
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: blogsState.blogs.take(5).map((blog) {
                    return Padding(
                      padding: EdgeInsetsDirectional.only(end: 16.w),
                      child: ArticleCard(blog: blog),
                    );
                  }).toList(),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),

        SizedBox(height: 10.h),
      ],
    );
  }

}

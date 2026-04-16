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
  final ScrollController _scrollController = ScrollController();

  void _scroll(bool forward) {
    double cardWidthWithSpacing = 220.w + 16.w;
    double targetOffset = forward
        ? _scrollController.offset + cardWidthWithSpacing
        : _scrollController.offset - cardWidthWithSpacing;

    _scrollController.animateTo(
      targetOffset.clamp(0.0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'articles_category'.tr(context),
                style: AppTextStyle.setStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF259CCB),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'articles_description'.tr(context),
                style: AppTextStyle.setStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.n900,
                ),
                textAlign: TextAlign.center,
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
              return Stack(
                alignment: Alignment.center,
                children: [
                  // Horizontal Scroll
                  SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Row(
                      children: blogsState.blogs.take(5).map((blog) {
                        return Padding(
                          padding: EdgeInsetsDirectional.only(end: 16.w),
                          child: ArticleCard(blog: blog),
                        );
                      }).toList(),
                    ),
                  ),
                  // Left Arrow
                  Positioned(
                    left: 10.w,
                    child: _buildArrow(
                      Icons.arrow_forward_ios,
                      () => _scroll(true),
                    ),
                  ),
                  // Right Arrow
                  Positioned(
                    right: 10.w,
                    child: _buildArrow(
                      Icons.arrow_back_ios_new,
                      () => _scroll(false),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),

        SizedBox(height: 30.h),

        // Show All Button
        Center(
          child: SizedBox(
            width: 120.w,
            height: 33.h,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const BlogsView()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF259CCB),
                foregroundColor: Colors.white,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(68.r),
                ),
                elevation: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'show_all'.tr(context),
                    style: AppTextStyle.setStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Directionality.of(context) == TextDirection.rtl
                        ? Icons.arrow_forward_ios
                        : Icons.arrow_back_ios,
                    size: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildArrow(IconData icon, VoidCallback onTap) {
    return Container(
      width: 32.w,
      height: 32.w,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: const Color(0xFFE4E4E4), width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(50.r),
          child: Center(
            child: Icon(
              icon,
              size: 14,
              color: const Color(0xFF9E9E9E),
            ),
          ),
        ),
      ),
    );
  }
}

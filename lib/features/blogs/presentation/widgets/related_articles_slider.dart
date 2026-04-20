import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/widgets/custom_network_image.dart';
import '../../domain/entities/blog_entity.dart';
import '../views/blog_details_view.dart';

class RelatedArticlesSlider extends StatelessWidget {
  final List<BlogEntity> articles;
  const RelatedArticlesSlider({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            'blog_similar'.tr(context),
            style: AppTextStyle.setStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 350.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemCount: articles.length,
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              return _buildArticleCard(context, articles[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildArticleCard(BuildContext context, BlogEntity blog) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlogDetailsView(blogId: blog.id),
          ),
        );
      },
      child: Container(
        width: 280.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.black.withOpacity(0.05)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
                child: blog.imageCover != null
                    ? CustomNetworkImage(
                        imageUrl: blog.imageCover!.url,
                        width: double.infinity,
                        height: 150.h,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: double.infinity,
                        height: 150.h,
                        color: Colors.grey[200],
                        child: const Icon(Icons.image_not_supported),
                      ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blog.title,
                    style: AppTextStyle.setStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1B3D6D),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    blog.excerpt,
                    style: AppTextStyle.setStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ).copyWith(height: 1.5),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'learn_more'.tr(context),
                        style: AppTextStyle.setStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF259CCB),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      const Icon(
                        Icons.arrow_forward_outlined,
                        size: 16,
                        color: Color(0xFF259CCB),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

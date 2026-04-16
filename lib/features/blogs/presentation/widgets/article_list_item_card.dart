import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/widgets/custom_network_image.dart';
import '../../domain/entities/blog_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:madar/core/routing/routes.dart';

class ArticleListItemCard extends StatelessWidget {
  final BlogEntity blog;
  const ArticleListItemCard({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.kBlogDetailsView, extra: blog.id);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.black.withOpacity(0.05)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              Padding(
                padding: EdgeInsets.all(12.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: blog.imageCover != null
                      ? CustomNetworkImage(
                          imageUrl: blog.imageCover!.url,
                          width: double.infinity,
                          height: 180.h,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: double.infinity,
                          height: 180.h,
                          color: Colors.grey[200],
                          child: const Icon(Icons.image_not_supported),
                        ),
                ),
              ),
              // Text Content
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      blog.title,
                      style: AppTextStyle.setStyle(
                        fontSize: 16,
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
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ).copyWith(height: 1.5),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 12.h),
                    // Action Row
                    Row(
                      children: [
                        Text(
                          'learn_more'.tr(context),
                          style: AppTextStyle.setStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF259CCB),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Icon(
                          Icons.arrow_forward_outlined,
                          size: 16.sp,
                          color: const Color(0xFF259CCB),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

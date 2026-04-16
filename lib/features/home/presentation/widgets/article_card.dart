import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/widgets/custom_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:madar/core/routing/routes.dart';
import '../../../blogs/domain/entities/blog_entity.dart';

class ArticleCard extends StatelessWidget {
  final BlogEntity blog;
  const ArticleCard({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return GestureDetector(
      onTap: () {
        context.push(Routes.kBlogDetailsView, extra: blog.id);
      },
      child: Container(
        width: 220.w,
        height: 350.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: const Color(0xFFF2F2F2), width: 1),
          boxShadow: [
            BoxShadow(
              color: const Color(0x2E000000), // #0000002E
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Article Image
              Container(
                height: 153.h,
                width: double.infinity,
                margin: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: blog.imageCover != null
                      ? CustomNetworkImage(
                          imageUrl: blog.imageCover!.url,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          color: Colors.grey[100],
                          child: const Icon(Icons.image_not_supported),
                        ),
                ),
              ),
              // Text Content
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog.title,
                        style: AppTextStyle.setStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF182D62),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        blog.excerpt,
                        style: AppTextStyle.setStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.n300,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                      const Spacer(),
                      // Learn More Link
                      Row(
                        mainAxisAlignment: isRtl
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        children: [
                          Text(
                            'learn_more'.tr(context),
                            style: AppTextStyle.setStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF259CCB),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            isRtl ? Icons.arrow_forward : Icons.arrow_back,
                            size: 16,
                            color: const Color(0xFF259CCB),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

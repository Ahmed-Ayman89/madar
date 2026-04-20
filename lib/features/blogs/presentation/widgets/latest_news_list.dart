import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/widgets/custom_network_image.dart';
import '../../domain/entities/blog_entity.dart';
import 'package:intl/intl.dart';

class LatestNewsList extends StatelessWidget {
  final List<BlogEntity> news;
  const LatestNewsList({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    if (news.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.black.withOpacity(0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'blog_latest'.tr(context),
              style: AppTextStyle.setStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: news.length,
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemBuilder: (context, index) {
                return _buildNewsItem(context, news[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsItem(BuildContext context, BlogEntity blog) {
    final dateStr = blog.createdAt != null
        ? DateFormat('dd MMM yyyy').format(blog.createdAt!)
        : '';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                blog.title,
                style: AppTextStyle.setStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1B3D6D),
                ).copyWith(height: 1.5),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (dateStr.isNotEmpty) ...[
                SizedBox(height: 8.h),
                Text(
                  dateStr,
                  style: AppTextStyle.setStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ],
            ],
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          flex: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: blog.imageCover != null
                ? CustomNetworkImage(
                    imageUrl: blog.imageCover!.url,
                    height: 70.h,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 70.h,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image_not_supported),
                  ),
          ),
        ),
      ],
    );
  }
}

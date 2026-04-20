import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/widgets/custom_network_image.dart';
import '../../domain/entities/blog_entity.dart';

class FeaturedArticleCard extends StatelessWidget {
  final BlogEntity blog;
  const FeaturedArticleCard({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            // Article Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: blog.imageCover != null
                  ? CustomNetworkImage(
                      imageUrl: blog.imageCover!.url,
                      width: double.infinity,
                      height: 200.h,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: double.infinity,
                      height: 200.h,
                      color: Colors.grey[200],
                      child: const Icon(Icons.image_not_supported),
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
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ).copyWith(height: 1.3),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      if (blog.createdAt != null)
                        Text(
                          DateFormat('yyyy-MM-dd').format(blog.createdAt!),
                          style: AppTextStyle.setStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      SizedBox(width: 8.w),
                      Container(
                        width: 4.r,
                        height: 4.r,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'blog_read_time'.tr(context),
                        style: AppTextStyle.setStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  // Actions Row
                  Row(
                    children: [
                      // Share Button
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'blog_share'.tr(context),
                              style: AppTextStyle.setStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Icon(Icons.share_outlined, size: 16.sp),
                          ],
                        ),
                      ),
                      const Spacer(),
                      // Social Icons
                      _buildSocialIcon(Icons.facebook, const Color(0xFF1877F2)),
                      SizedBox(width: 8.w),
                      _buildSocialIcon(
                        Icons.camera_alt_outlined,
                        const Color(0xFFE4405F),
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

  Widget _buildSocialIcon(IconData icon, Color color) {
    return Container(
      width: 36.r,
      height: 36.r,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black.withOpacity(0.1)),
      ),
      child: Center(child: Icon(icon, color: color, size: 20.sp)),
    );
  }
}

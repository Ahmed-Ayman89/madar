import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/widgets/custom_network_image.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import '../../domain/entities/project_entity.dart';

import 'package:go_router/go_router.dart';
import 'package:madar/core/routing/routes.dart';

class ProjectCardWidget extends StatelessWidget {
  final ProjectEntity project;

  const ProjectCardWidget({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(Routes.kProjectDetailsView, extra: project.id);
      },
      child: Container(
        width: 343.w,
        height: 153.h,
        margin: EdgeInsets.only(bottom: 20.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: const Color(0xFFD9D9D9), width: 1),
          boxShadow: [
            BoxShadow(
              color: const Color(0x2E000000),
              offset: const Offset(0, 2),
              blurRadius: 12.r,
            ),
          ],
        ),
        child: Row(
          children: [
            // Project Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CustomNetworkImage(
                imageUrl: project.imageUrl,
                width: 120.w,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.w),
            // Project Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          project.title,
                          style: AppTextStyle.setStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF182D62),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (project.logoUrl != null)
                        CustomNetworkImage(
                          imageUrl: project.logoUrl!,
                          height: 24.h,
                          fit: BoxFit.contain,
                        ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    project.description,
                    style: AppTextStyle.setStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.6),
                    ).copyWith(height: 1.4),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  // Learn More
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'learn_more'.tr(context),
                        style: AppTextStyle.setStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF259CCB),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.arrow_back,
                        size: 14.sp,
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
    );
  }
}

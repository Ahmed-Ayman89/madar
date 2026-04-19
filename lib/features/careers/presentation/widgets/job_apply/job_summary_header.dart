import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/widgets/custom_header_widget.dart';
import 'package:madar/features/careers/domain/entities/job_entity.dart';

class JobSummaryHeader extends StatelessWidget {
  final JobEntity job;
  const JobSummaryHeader({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return CustomHeaderWidget(
      title: 'join_team_title'.tr(context),
      titleStyle: AppTextStyle.setWhite(
        fontSize: 22,
        fontWeight: FontWeight.w800,
      ),
      subtitle: '${'join_team_desc'.tr(context).split('.')[0]}.',
      subtitleStyle: AppTextStyle.setWhite(
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ).copyWith(height: 1.5),
      content: Padding(
        padding: EdgeInsets.only(bottom: 20.h, top: 20.h),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              Text(
                job.title,
                textAlign: TextAlign.center,
                style: AppTextStyle.setStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                '(${job.type} • ${job.location})',
                style: AppTextStyle.setStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.n700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

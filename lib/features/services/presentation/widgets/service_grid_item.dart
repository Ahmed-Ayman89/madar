import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madar/core/helper/app_text_style.dart';
import '../../domain/entities/service_entity.dart';

class ServiceCard extends StatelessWidget {
  final ServiceEntity service;

  const ServiceCard({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: const Color(0xFF142047).withOpacity(0.7),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.white.withOpacity(0.15),
          width: 0.8,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          /// ICON CIRCLE
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.08),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 0.5,
              ),
            ),
            child: service.iconUrl.isNotEmpty &&
                    service.iconUrl.startsWith('http')
                ? SvgPicture.network(
                    service.iconUrl,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                    width: 20.sp,
                    height: 20.sp,
                    placeholderBuilder: (_) => Icon(
                      Icons.miscellaneous_services,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  )
                : Icon(
                    Icons.miscellaneous_services,
                    color: Colors.white,
                    size: 20.sp,
                  ),
          ),

          const Spacer(),

          /// TITLE
          Text(
            service.title,
            textAlign: TextAlign.right,
            style: AppTextStyle.setWhite(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: 8.h),

          /// DESCRIPTION
          Text(
            service.description,
            textAlign: TextAlign.right,
            style: AppTextStyle.setWhite(
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ).copyWith(
              color: Colors.white.withOpacity(0.7),
              height: 1.5,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

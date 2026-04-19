import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:madar/core/helper/app_text_style.dart';

class TeamCardWidget extends StatelessWidget {
  final String name;
  final String title;
  final String imageUrl;

  const TeamCardWidget({
    super.key,
    required this.name,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175.w,
      height: 250.h,
      decoration: BoxDecoration(
        color: const Color(0x335B7ED7), // 20% opacity semi-transparent blue
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Middle subtle divider
          Positioned(
            top: 140.h,
            left: 20.w,
            right: 20.w,
            child: Container(
              height: 1,
              color: Colors.white.withOpacity(0.15),
            ),
          ),
          
          Column(
            children: [
              SizedBox(height: 24.h),
              // Name text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  name,
                  style: AppTextStyle.setWhite(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ).copyWith(
                    fontFamily: 'Playfair Display', // Using a premium-feel font if available
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 4.h),
              // Job Title text
              Text(
                title,
                style: AppTextStyle.setWhite(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ).copyWith(
                  color: Colors.white.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: 18.h),
              
              // Avatar with thick white border
              Container(
                width: 86.r,
                height: 86.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.white24,
                      child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/photo/madar_logo.png', // Fallback
                      fit: BoxFit.contain,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              
              const Spacer(),
              
              // Bottom Madar Logo
              Opacity(
                opacity: 0.8,
                child: Image.asset(
                  'assets/photo/madar_header.png', // Or madar_logo_white if exists
                  height: 16.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ],
      ),
    );
  }
}

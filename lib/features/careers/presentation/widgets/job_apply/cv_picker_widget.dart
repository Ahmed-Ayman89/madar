import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';

class CvPickerWidget extends StatelessWidget {
  final File? cvFile;
  final String? cvUrl;
  final bool isUploading;
  final VoidCallback onTap;

  const CvPickerWidget({
    super.key,
    this.cvFile,
    this.cvUrl,
    required this.isUploading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.h, top: 16.h),
          child: RichText(
            text: TextSpan(
              text: 'cv_file'.tr(context),
              style: AppTextStyle.setStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              children: const [
                TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: isUploading ? null : onTap,
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    cvFile != null
                        ? cvFile!.path.split('/').last
                        : 'upload_cv_hint'.tr(context),
                    style: AppTextStyle.setStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                if (isUploading)
                  SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: const CircularProgressIndicator(strokeWidth: 2),
                  )
                else if (cvUrl != null)
                  const Icon(Icons.check_circle, color: Colors.green)
                else
                  const Icon(Icons.attach_file),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

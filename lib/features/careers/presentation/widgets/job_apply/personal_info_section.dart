import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';

class PersonalInfoSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController linkController;
  final Function(String) onPhoneChanged;

  const PersonalInfoSection({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.linkController,
    required this.onPhoneChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'personal_info'),
        SizedBox(height: 20.h),
        _buildLabel(context, 'form_full_name', required: true),
        _buildTextField(
          context,
          controller: nameController,
          errorKey: 'full_name_required',
        ),
        _buildLabel(context, 'form_email', required: true),
        _buildTextField(
          context,
          controller: emailController,
          errorKey: 'email_invalid',
          isEmail: true,
        ),
        _buildLabel(context, 'form_phone', required: true),
        _buildPhoneField(context),
        _buildLabel(context, 'personal_link'),
        _buildTextField(
          context,
          controller: linkController,
          errorKey: null,
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String key) {
    return Text(
      key.tr(context),
      style: AppTextStyle.setStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }

  Widget _buildLabel(BuildContext context, String key, {bool required = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, top: 16.h),
      child: RichText(
        text: TextSpan(
          text: key.tr(context),
          style: AppTextStyle.setStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          children: [
            if (required)
              const TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    String? errorKey,
    bool isEmail = false,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      ),
      validator: (value) {
        if (errorKey != null && (value == null || value.isEmpty)) {
          return errorKey.tr(context);
        }
        if (isEmail && value != null && value.isNotEmpty && !value.contains('@')) {
          return 'email_invalid'.tr(context);
        }
        return null;
      },
    );
  }

  Widget _buildPhoneField(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      ),
      initialCountryCode: 'SA',
      onChanged: (phone) {
        onPhoneChanged(phone.completeNumber);
      },
      validator: (phone) {
        if (phone == null || phone.completeNumber.isEmpty) {
          return 'phone_required'.tr(context);
        }
        return null;
      },
    );
  }
}

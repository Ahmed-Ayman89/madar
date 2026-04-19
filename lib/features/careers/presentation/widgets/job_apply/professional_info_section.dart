import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';

class ProfessionalInfoSection extends StatelessWidget {
  final String? experienceYears;
  final List<String> selectedSkills;
  final String? currentStatus;
  final String? currentLocation;
  final Function(String?) onExperienceChanged;
  final Function(String, bool) onSkillChanged;
  final Function(String?) onStatusChanged;
  final Function(String?) onLocationChanged;

  const ProfessionalInfoSection({
    super.key,
    this.experienceYears,
    required this.selectedSkills,
    this.currentStatus,
    this.currentLocation,
    required this.onExperienceChanged,
    required this.onSkillChanged,
    required this.onStatusChanged,
    required this.onLocationChanged,
  });

  static const List<String> _experienceOptions = [
    '0 - 1 سنة',
    '2 - 3 سنة',
    '4 - 5 سنة',
    '+5 سنة',
  ];

  static const List<String> _skillsOptions = [
    'Node.js',
    'Python',
    'PHP',
    'Java',
    'MySQL',
    'MongoDB',
    'Docker',
    'AWS',
    'أخرى',
  ];

  static const List<String> _statusOptions = [
    'أعمل كمستقل (Freelancer)',
    'موظف بدوام كامل',
    'موظف بدوام جزئي',
    'باحث عن عمل',
  ];

  static const List<String> _locations = [
    'الرياض',
    'جدة',
    'الدمام',
    'المنصورة',
    'القاهرة',
    'أخرى',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'professional_info'),
        SizedBox(height: 20.h),
        _buildLabel(context, 'experience_years', required: true),
        _buildExperienceRadio(),
        SizedBox(height: 20.h),
        _buildLabel(context, 'skills_tools', required: true),
        _buildSkillsCheckboxes(),
        SizedBox(height: 20.h),
        _buildLabel(context, 'current_status', required: true),
        _buildDropdown(context, _statusOptions, currentStatus, onStatusChanged),
        SizedBox(height: 20.h),
        _buildLabel(context, 'current_location', required: true),
        _buildDropdown(
          context,
          _locations,
          currentLocation,
          onLocationChanged,
          hint: 'city',
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

  Widget _buildLabel(
    BuildContext context,
    String key, {
    bool required = false,
  }) {
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
              const TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceRadio() {
    return Column(
      children: _experienceOptions
          .map(
            (opt) => RadioListTile<String>(
              title: Text(
                opt,
                style: AppTextStyle.setStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              value: opt,
              groupValue: experienceYears,
              onChanged: onExperienceChanged,
              contentPadding: EdgeInsets.zero,
            ),
          )
          .toList(),
    );
  }

  Widget _buildSkillsCheckboxes() {
    return Column(
      children: _skillsOptions
          .map<Widget>(
            (skill) => CheckboxListTile(
              title: Text(
                skill,
                style: AppTextStyle.setStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              value: selectedSkills.contains(skill),
              onChanged: (val) => onSkillChanged(skill, val ?? false),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
          )
          .toList(),
    );
  }

  Widget _buildDropdown(
    BuildContext context,
    List<String> options,
    String? value,
    Function(String?) onChanged, {
    String? hint,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        hintText: hint?.tr(context),
      ),
      items: options
          .map((opt) => DropdownMenuItem(value: opt, child: Text(opt)))
          .toList(),
      onChanged: onChanged,
      validator: (val) => val == null ? 'field_required'.tr(context) : null,
    );
  }
}

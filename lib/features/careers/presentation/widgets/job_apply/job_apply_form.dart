import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/features/careers/domain/entities/job_apply_request_entity.dart';
import 'package:madar/features/careers/domain/entities/job_entity.dart';
import 'package:madar/features/careers/presentation/cubit/job_apply_cubit.dart';
import 'package:madar/features/careers/presentation/cubit/job_apply_state.dart';

import 'cv_picker_widget.dart';
import 'personal_info_section.dart';
import 'professional_info_section.dart';
import 'submit_application_button.dart';

class JobApplyForm extends StatefulWidget {
  final JobEntity job;
  const JobApplyForm({super.key, required this.job});

  @override
  State<JobApplyForm> createState() => _JobApplyFormState();
}

class _JobApplyFormState extends State<JobApplyForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _linkController = TextEditingController();
  String _phone = '';

  String? _experienceYears;
  final List<String> _selectedSkills = [];
  String? _currentStatus;
  String? _currentLocation;
  File? _cvFile;
  String? _cvUrl;
  bool _isUploadingCv = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  Future<void> _pickCv() async {
    try {
      final FilePickerResult? result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null && result.files.isNotEmpty) {
        final path = result.files.first.path;
        if (path != null) {
          final file = File(path);
          setState(() {
            _cvFile = file;
          });
          if (mounted) {
            context.read<JobApplyCubit>().uploadCv(file);
          }
        }
      }
    } catch (e) {
      debugPrint('Error picking file: $e');
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Error selecting file')));
      }
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_cvUrl == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('cv_required'.tr(context))));
      return;
    }

    final request = JobApplyRequestEntity(
      jobId: widget.job.id,
      fullName: _nameController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phone,
      personalLink: _linkController.text.trim(),
      experienceYears: _experienceYears ?? '',
      skills: List.from(_selectedSkills),
      currentStatus: _currentStatus ?? '',
      currentLocation: _currentLocation ?? '',
      cv: _cvUrl!,
    );

    context.read<JobApplyCubit>().applyForJob(request);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<JobApplyCubit, JobApplyState>(
      listener: (context, state) {
        if (state is JobApplySuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('application_success'.tr(context))),
          );
          Navigator.pop(context);
        } else if (state is JobApplyError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is JobCvUploading) {
          setState(() {
            _isUploadingCv = true;
          });
        } else if (state is JobCvUploaded) {
          setState(() {
            _isUploadingCv = false;
            _cvUrl = state.url;
          });
        } else if (state is JobCvUploadError) {
          setState(() {
            _isUploadingCv = false;
          });
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            PersonalInfoSection(
              nameController: _nameController,
              emailController: _emailController,
              linkController: _linkController,
              onPhoneChanged: (phone) => _phone = phone,
            ),
            SizedBox(height: 30.h),
            ProfessionalInfoSection(
              experienceYears: _experienceYears,
              selectedSkills: _selectedSkills,
              currentStatus: _currentStatus,
              currentLocation: _currentLocation,
              onExperienceChanged: (val) =>
                  setState(() => _experienceYears = val),
              onSkillChanged: (skill, selected) {
                setState(() {
                  if (selected) {
                    _selectedSkills.add(skill);
                  } else {
                    _selectedSkills.remove(skill);
                  }
                });
              },
              onStatusChanged: (val) => setState(() => _currentStatus = val),
              onLocationChanged: (val) =>
                  setState(() => _currentLocation = val),
            ),
            SizedBox(height: 30.h),
            CvPickerWidget(
              cvFile: _cvFile,
              cvUrl: _cvUrl,
              isUploading: _isUploadingCv,
              onTap: _pickCv,
            ),
            SizedBox(height: 40.h),
            BlocBuilder<JobApplyCubit, JobApplyState>(
              builder: (context, state) {
                return SubmitApplicationButton(
                  isLoading: state is JobApplyLoading || _isUploadingCv,
                  onPressed: _submit,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

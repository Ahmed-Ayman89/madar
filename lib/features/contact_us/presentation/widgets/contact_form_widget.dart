import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/network/api_helper.dart';
import 'package:madar/features/contact_us/data/data_sources/contact_remote_data_source.dart';
import 'package:madar/features/contact_us/data/repositories/contact_repository_impl.dart';
import 'package:madar/features/contact_us/domain/entities/contact_entity.dart';
import 'package:madar/features/contact_us/presentation/cubit/contact_cubit.dart';
import 'package:madar/features/contact_us/presentation/cubit/contact_state.dart';
import 'custom_text_field.dart';

class ContactFormWidget extends StatefulWidget {
  const ContactFormWidget({super.key});

  @override
  State<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _projectTypeController = TextEditingController();
  final _companyNameController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _projectTypeController.dispose();
    _companyNameController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm(BuildContext context) {
    if (_nameController.text.trim().isEmpty) {
      _showSnackbar(context, 'Name is required', isError: true);
      return;
    }
    if (_emailController.text.trim().isEmpty) {
      _showSnackbar(context, 'Email is required', isError: true);
      return;
    }
    if (_messageController.text.trim().isEmpty) {
      _showSnackbar(context, 'Message is required', isError: true);
      return;
    }

    final contact = ContactEntity(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      companyName: _companyNameController.text.trim(),
      projectType: _projectTypeController.text.trim(),
      message: _messageController.text.trim(),
    );

    context.read<ContactCubit>().sendMessage(contact);
  }

  void _showSnackbar(BuildContext context, String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  void _clearForm() {
    _nameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _projectTypeController.clear();
    _companyNameController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactCubit(
        ContactRepositoryImpl(ContactRemoteDataSource(APIHelper())),
      ),
      child: BlocConsumer<ContactCubit, ContactState>(
        listener: (context, state) {
          if (state is ContactSuccess) {
            _showSnackbar(context, state.message);
            _clearForm();
          } else if (state is ContactError) {
            _showSnackbar(context, state.message, isError: true);
          }
        },
        builder: (context, state) {
          final isLoading = state is ContactLoading;

          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: const Color(0xFF1E2E5B),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 44.h,
                  child: CustomTextField(
                    hintText: 'form_full_name'.tr(context),
                    controller: _nameController,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 44.h,
                        child: CustomTextField(
                          hintText: 'form_phone'.tr(context),
                          controller: _phoneController,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: SizedBox(
                        height: 44.h,
                        child: CustomTextField(
                          hintText: 'form_email'.tr(context),
                          controller: _emailController,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 44.h,
                        child: CustomTextField(
                          hintText: 'form_project_type'.tr(context),
                          controller: _projectTypeController,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: SizedBox(
                        height: 44.h,
                        child: CustomTextField(
                          hintText: 'form_company_name'.tr(context),
                          controller: _companyNameController,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  height: 120.h,
                  child: CustomTextField(
                    hintText: 'form_message'.tr(context),
                    maxLines: 5,
                    controller: _messageController,
                  ),
                ),
                SizedBox(height: 30.h),
                SizedBox(
                  width: 157.w,
                  height: 46.h,
                  child: ElevatedButton.icon(
                    onPressed: isLoading ? null : () => _submitForm(context),
                    icon: isLoading
                        ? SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : SvgPicture.asset(
                            'assets/icon/sent.svg',
                            width: 36.w,
                            height: 36.h,
                          ),
                    label: Text(
                      isLoading ? 'Sending...' : 'form_submit'.tr(context),
                      style: AppTextStyle.setWhite(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      maximumSize: Size(157.w, 44.h),
                      backgroundColor: const Color(0xFF259CCB),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(96.r),
                      ),
                      disabledBackgroundColor: const Color(0xFF259CCB).withOpacity(0.6),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

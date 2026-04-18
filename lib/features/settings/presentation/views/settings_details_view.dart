import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/localization/locale_cubit.dart';
import 'package:madar/core/widgets/custom_header_widget.dart';
import '../cubit/settings_cubit.dart';
import '../cubit/settings_state.dart';

class SettingsDetailsView extends StatelessWidget {
  const SettingsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading || state is SettingsInitial) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFF259CCB)));
          } else if (state is SettingsError) {
            return Center(child: Text(state.message));
          } else if (state is SettingsLoaded) {
            final settings = state.settings;
            final isAr = context.read<LocaleCubit>().state.locale.languageCode == 'ar';

            return SingleChildScrollView(
              child: Column(
                children: [
                  CustomHeaderWidget(
                    title: isAr ? settings.companyNameAr : settings.companyName,
                    titleStyle: AppTextStyle.setWhite(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                    subtitle: 'settings_details_subtitle'.tr(context),
                    subtitleStyle: AppTextStyle.setStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF259CCB),
                    ),
                    content: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        isAr ? settings.footerTextAr : settings.footerText,
                        style: AppTextStyle.setWhite(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ).copyWith(
                          color: Colors.white.withOpacity(0.85),
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildContactCard(
                          icon: Icons.phone_android,
                          title: 'phone_number'.tr(context),
                          value: settings.phone,
                        ),
                        _buildContactCard(
                          icon: Icons.chat_bubble_outline,
                          title: 'whatsapp'.tr(context),
                          value: settings.whatsapp.isNotEmpty ? settings.whatsapp : 'not_available'.tr(context),
                        ),
                        _buildContactCard(
                          icon: Icons.email_outlined,
                          title: 'email'.tr(context),
                          value: settings.email.isNotEmpty ? settings.email : settings.supportEmail,
                        ),
                        _buildContactCard(
                          icon: Icons.location_on_outlined,
                          title: 'address'.tr(context),
                          value: isAr ? settings.addressAr : settings.address,
                        ),
                        SizedBox(height: 20.h),
                        if (settings.copyrightAr.isNotEmpty || settings.copyright.isNotEmpty)
                          Center(
                            child: Text(
                              isAr ? settings.copyrightAr : settings.copyright,
                              style: AppTextStyle.setStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildContactCard({required IconData icon, required String title, required String value}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFF3F4F6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: const Color(0xFFE3EFF5),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, color: const Color(0xFF1F7FAF), size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.setStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: AppTextStyle.setStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1F1F1F),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'package:madar/core/localization/locale_cubit.dart';
import 'package:madar/core/widgets/custom_app_bar.dart';
import 'package:madar/core/network/api_helper.dart';
import '../widgets/service_grid_item.dart';
import '../widgets/tech_field_card.dart';
import '../widgets/faq_item_widget.dart';
import '../cubit/services_cubit.dart';
import '../cubit/services_state.dart';
import '../../data/data_sources/services_remote_data_source.dart';
import '../../data/repositories/services_repository_impl.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final lang = context.read<LocaleCubit>().state.locale.languageCode;
        return ServicesCubit(
          ServicesRepositoryImpl(ServicesRemoteDataSource(APIHelper())),
        )..getServices(lang: lang);
      },
      child: BlocBuilder<ServicesCubit, ServicesState>(
        builder: (context, state) {
          // Data for technical fields (static for now)
          final List<Map<String, dynamic>> techFields = [
            {
              'title': 'tech_frontend_title'.tr(context),
              'desc': 'tech_frontend_desc'.tr(context),
              'icon': Icons.code,
            },
            {
              'title': 'tech_backend_title'.tr(context),
              'desc': 'tech_backend_desc'.tr(context),
              'icon': Icons.storage,
            },
            {
              'title': 'tech_flutter_title'.tr(context),
              'desc': 'tech_flutter_desc'.tr(context),
              'icon': Icons.flutter_dash,
            },
            {
              'title': 'tech_uiux_title'.tr(context),
              'desc': 'tech_uiux_desc'.tr(context),
              'icon': Icons.design_services,
            },
          ];

          // FAQ data (static for now)
          final List<Map<String, String>> faqItems = [
            {'q': 'faq_q1'.tr(context), 'a': 'faq_a1'.tr(context)},
            {'q': 'faq_q2'.tr(context), 'a': 'faq_a2'.tr(context)},
            {'q': 'faq_q3'.tr(context), 'a': 'faq_a3'.tr(context)},
            {'q': 'faq_q4'.tr(context), 'a': 'faq_a4'.tr(context)},
          ];

          return Scaffold(
              appBar: CustomAppBar(
                title: 'services_page_title'.tr(context),
              ),
              backgroundColor: AppColors.white,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    // Subtitle
                    Text(
                      'services_page_subtitle'.tr(context),
                      style: AppTextStyle.setStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),
                    // Description
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        'services_page_description'.tr(context),
                        style: AppTextStyle.setStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.6),
                        ).copyWith(height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: _buildServicesGrid(state, context),
                    ),
                    SizedBox(height: 50.h),

                  // SECTION 2: Technical Fields
                  SizedBox(height: 60.h),
                  Column(
                    children: [
                      Text(
                        'tech_fields_category'.tr(context),
                        style: AppTextStyle.setStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF259CCB),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          'tech_fields_main_title'.tr(context),
                          style: AppTextStyle.setStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ).copyWith(height: 1.3),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      // Grid View for Tech Fields
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16.w,
                                mainAxisSpacing: 16.h,
                                childAspectRatio: 168 / 130,
                              ),
                          itemCount: techFields.length,
                          itemBuilder: (context, index) {
                            return TechFieldCard(
                              title: techFields[index]['title'],
                              description: techFields[index]['desc'],
                              icon: Icon(
                                techFields[index]['icon'],
                                color: Colors.white,
                                size: 14.sp,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  // SECTION 3: FAQ
                  SizedBox(height: 80.h),
                  Column(
                    children: [
                      Text(
                        'faq_category'.tr(context),
                        style: AppTextStyle.setStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF259CCB),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          'faq_main_title'.tr(context),
                          style: AppTextStyle.setStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ).copyWith(height: 1.3),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          'faq_description'.tr(context),
                          style: AppTextStyle.setStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.7),
                          ).copyWith(height: 1.5),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      // List of FAQ items
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: faqItems.length,
                          itemBuilder: (context, index) {
                            return FaqItemWidget(
                              question: faqItems[index]['q']!,
                              answer: faqItems[index]['a']!,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildServicesGrid(ServicesState state, BuildContext context) {
    if (state is ServicesLoading || state is ServicesInitial) {
      return SizedBox(
        height: 200.h,
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    } else if (state is ServicesError) {
      return SizedBox(
        height: 250.h,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cloud_off_rounded,
                color: Colors.white,
                size: 48,
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  state.message,
                  style: AppTextStyle.setWhite(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 12.h),
              ElevatedButton(
                onPressed: () => context.read<ServicesCubit>().getServices(
                  lang: context.read<LocaleCubit>().state.locale.languageCode,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF259CCB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    } else if (state is ServicesLoaded) {
      if (state.services.isEmpty) {
        return SizedBox(
          height: 200.h,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.inventory_2_outlined,
                  color: Colors.white.withOpacity(0.6),
                  size: 48,
                ),
                SizedBox(height: 12.h),
                Text(
                  'No services available at the moment.',
                  style: AppTextStyle.setWhite(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ).copyWith(color: Colors.white.withOpacity(0.8)),
                ),
              ],
            ),
          ),
        );
      }
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 0.8,
        ),
        itemCount: state.services.length,
        itemBuilder: (context, index) {
          return ServiceCard(service: state.services[index]);
        },
      );
    }
    return const SizedBox.shrink();
  }
}

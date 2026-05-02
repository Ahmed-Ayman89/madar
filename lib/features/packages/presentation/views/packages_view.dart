import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/network/api_helper.dart';
import 'package:madar/features/packages/data/data_sources/packages_remote_data_source.dart';
import 'package:madar/features/packages/data/repositories/packages_repository_impl.dart';
import 'package:madar/features/packages/presentation/cubit/packages_cubit.dart';
import 'package:madar/core/widgets/custom_app_bar.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/features/packages/presentation/cubit/packages_state.dart';
import 'package:madar/features/packages/presentation/widgets/pricing_card_widget.dart';

class PackagesView extends StatefulWidget {
  const PackagesView({super.key});

  @override
  State<PackagesView> createState() => _PackagesViewState();
}

class _PackagesViewState extends State<PackagesView> {
  bool isYearly = true;

  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;
    return BlocProvider(
      create: (context) => PackagesCubit(
        PackagesRepositoryImpl(PackagesRemoteDataSource(APIHelper())),
      )..getPackages(lang: lang),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'الباقات'),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              // Search Bar
              Container(
                height: 48.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: const Color(0xFFD9D9D9)),
                ),
                child: TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: 'بحث عن باقات',
                    hintStyle: AppTextStyle.setStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF9E9E9E),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF9E9E9E),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              // Section Title with Dividers
              Row(
                children: [
                  const Expanded(child: Divider(color: Color(0xFFE0E0E0))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'اختر الباقة المناسبة',
                      style: AppTextStyle.setStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF182D62),
                      ),
                    ),
                  ),
                  const Expanded(child: Divider(color: Color(0xFFE0E0E0))),
                ],
              ),
              SizedBox(height: 24.h),
              // Toggle
              Container(
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildToggleButton('شهرياً', !isYearly),
                    _buildToggleButton('سنوياً', isYearly),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              // Package List
              Expanded(
                child: BlocBuilder<PackagesCubit, PackagesState>(
                  builder: (context, state) {
                    if (state is PackagesLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF259CCB),
                        ),
                      );
                    } else if (state is PackagesError) {
                      return Center(child: Text(state.message));
                    } else if (state is PackagesLoaded) {
                      return ListView.separated(
                        itemCount: state.packages.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16.h),
                        itemBuilder: (context, index) {
                          return PricingCardWidget(
                            package: state.packages[index],
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, bool selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isYearly = (text == 'سنوياً');
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          text,
          style: AppTextStyle.setStyle(
            fontSize: 14,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            color: selected ? const Color(0xFF182D62) : const Color(0xFF9E9E9E),
          ),
        ),
      ),
    );
  }
}

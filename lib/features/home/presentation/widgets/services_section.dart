import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madar/features/services/presentation/cubit/services_cubit.dart';
import 'package:madar/features/services/presentation/cubit/services_state.dart';
import 'services_header.dart';
import 'service_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Modular Header
          const ServicesHeader(),

          SizedBox(height: 24.h),

          // Grid of Services
          BlocBuilder<ServicesCubit, ServicesState>(
            builder: (context, state) {
              if (state is ServicesLoading || state is ServicesInitial) {
                return SizedBox(
                  height: 150.h,
                  child: const Center(
                    child: CircularProgressIndicator(color: Color(0xFF259CCB)),
                  ),
                );
              } else if (state is ServicesError) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              } else if (state is ServicesLoaded) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 166 / 156,
                  ),
                  itemCount: state.services.length > 6
                      ? 6
                      : state.services.length,
                  itemBuilder: (context, index) {
                    return ServiceCard(service: state.services[index]);
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

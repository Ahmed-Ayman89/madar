import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/features/packages/presentation/cubit/packages_cubit.dart';
import 'package:madar/features/packages/presentation/cubit/packages_state.dart';

import 'package:madar/features/packages/presentation/widgets/package_card_widget.dart';

class PackagesList extends StatelessWidget {
  const PackagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackagesCubit, PackagesState>(
      builder: (context, state) {
        if (state is PackagesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PackagesError) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                children: [
                  Text(
                    state.message,
                    style: AppTextStyle.setStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () => context.read<PackagesCubit>().getPackages(
                          lang: Localizations.localeOf(context).languageCode,
                        ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        } else if (state is PackagesLoaded) {
          if (state.packages.isEmpty) {
            return const Center(child: Text('No packages available'));
          }
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.packages.length,
            itemBuilder: (context, index) {
              final package = state.packages[index];
              return PackageCardWidget(
                package: package,
                icon: _getIconForOrder(package.order),
                iconColor: _getIconColorForOrder(package.order),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  IconData _getIconForOrder(int order) {
    switch (order) {
      case 1:
        return Icons.rocket_launch_outlined;
      case 2:
        return Icons.star_border;
      case 3:
        return Icons.bolt;
      default:
        return Icons.card_membership;
    }
  }

  Color _getIconColorForOrder(int order) {
    switch (order) {
      case 1:
        return Colors.green;
      case 2:
        return const Color(0xFFF59E0B);
      case 3:
        return const Color(0xFF14244B);
      default:
        return const Color(0xFF14244B);
    }
  }
}

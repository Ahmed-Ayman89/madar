import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madar/core/network/api_helper.dart';
import 'package:madar/features/packages/data/data_sources/packages_remote_data_source.dart';
import 'package:madar/features/packages/data/repositories/packages_repository_impl.dart';
import 'package:madar/features/packages/presentation/cubit/packages_cubit.dart';

import '../widgets/packages_header.dart';
import '../widgets/packages_section_title.dart';
import '../widgets/packages_list.dart';

class PackagesView extends StatelessWidget {
  const PackagesView({super.key});

  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;
    return BlocProvider(
      create: (context) => PackagesCubit(
        PackagesRepositoryImpl(PackagesRemoteDataSource(APIHelper())),
      )..getPackages(lang: lang),
      child: const Scaffold(
        backgroundColor: Color(0xFFF9FAFB),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PackagesHeader(),
              PackagesSectionTitle(),
              PackagesList(),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

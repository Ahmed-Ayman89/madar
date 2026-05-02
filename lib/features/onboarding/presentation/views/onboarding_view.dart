import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/routing/routes.dart';
import 'package:madar/features/onboarding/data/models/onboarding_model.dart';
import '../widgets/custom_dot_indicator.dart';
import '../widgets/onboarding_action_buttons.dart';
import '../widgets/onboarding_page_content.dart';

import 'package:madar/core/localization/app_localizations.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToHome() {
    context.go(Routes.kSignUpView);
  }

  void _nextPage(int itemsCount) {
    if (_currentPage == itemsCount - 1) {
      _navigateToHome();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<OnboardingModel> onboardingData = [
      OnboardingModel(
        title: 'onboard_1_title'.tr(context),
        description: 'onboard_1_desc'.tr(context),
        image: 'assets/photo/onboard1.jpg',
      ),
      OnboardingModel(
        title: 'onboard_2_title'.tr(context),
        description: 'onboard_2_desc'.tr(context),
        image: 'assets/photo/onboard2.jpg',
      ),
      OnboardingModel(
        title: 'onboard_3_title'.tr(context),
        description: 'onboard_3_desc'.tr(context),
        image: 'assets/photo/onboard3.jpg',
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              return OnboardingPageContent(model: onboardingData[index]);
            },
          ),
          Positioned(
            bottom: 50.h,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomDotIndicator(
                  currentIndex: _currentPage,
                  itemCount: onboardingData.length,
                ),
                SizedBox(height: 30.h),
                OnboardingActionButtons(
                  currentIndex: _currentPage,
                  itemCount: onboardingData.length,
                  onSkip: _navigateToHome,
                  onNext: () => _nextPage(onboardingData.length),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

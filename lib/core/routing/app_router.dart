import 'package:go_router/go_router.dart';
import 'package:madar/features/main/presentation/views/main_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import 'routes.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: Routes.kOnboardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: Routes.kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: Routes.kMainView,
        builder: (context, state) => const MainView(),
      ),
    ],
  );
}

import 'package:go_router/go_router.dart';
import 'package:madar/features/main/presentation/views/main_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/projects/presentation/views/project_details_view.dart';
import '../../features/blogs/presentation/views/blog_details_view.dart';
import '../../features/careers/presentation/views/job_details_view.dart';
import '../../features/careers/presentation/views/job_apply_view.dart';
import '../../features/careers/domain/entities/job_entity.dart';
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
      GoRoute(
        path: Routes.kProjectDetailsView,
        builder: (context, state) {
          final projectId = state.extra as String;
          return ProjectDetailsView(projectId: projectId);
        },
      ),
      GoRoute(
        path: Routes.kBlogDetailsView,
        builder: (context, state) {
          final blogId = state.extra as String;
          return BlogDetailsView(blogId: blogId);
        },
      ),
      GoRoute(
        path: Routes.kJobDetailsView,
        builder: (context, state) {
          final jobId = state.extra as String;
          return JobDetailsView(jobId: jobId);
        },
      ),
      GoRoute(
        path: Routes.kJobApplyView,
        builder: (context, state) {
          final job = state.extra as JobEntity;
          return JobApplyView(job: job);
        },
      ),
    ],
  );
}

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
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/auth/presentation/views/otp_verification_view.dart';
import '../../features/auth/presentation/views/reset_password_view.dart';
import '../../features/auth/presentation/views/user_type_view.dart';
import '../../features/auth/presentation/views/interests_view.dart';
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
      GoRoute(
        path: Routes.kSignUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: Routes.kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: Routes.kForgotPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: Routes.kOtpVerificationView,
        builder: (context, state) => const OtpVerificationView(),
      ),
      GoRoute(
        path: Routes.kResetPasswordView,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: Routes.kUserTypeView,
        builder: (context, state) => const UserTypeView(),
      ),
      GoRoute(
        path: Routes.kInterestsView,
        builder: (context, state) => const InterestsView(),
      ),
    ],
  );
}

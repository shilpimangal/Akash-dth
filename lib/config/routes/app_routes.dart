import 'package:Akash/config/routes/page_path.dart';
import 'package:Akash/presenter/pages/auth/forgot_pin_page.dart';
import 'package:Akash/presenter/pages/auth/guest_login_page.dart';
import 'package:Akash/presenter/pages/auth/login_page.dart';
import 'package:Akash/presenter/pages/auth/register_page.dart';
import 'package:go_router/go_router.dart';
import '../../presenter/pages/navigation/navigation_page.dart';
import '../../presenter/pages/splash/splash_page.dart';

class AppRoutes {
  final router = GoRouter(
    initialLocation: PagePath.splashPage,
    routes: [
      GoRoute(
        path: PagePath.splashPage,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: PagePath.navigationPage,
        builder: (context, state) => const NavigationPage(),
      ),
      GoRoute(
        path: PagePath.loginPage,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: PagePath.registerPage,
        builder: (context, state) => RegisterPage(),
      ),
      GoRoute(
        path: PagePath.forgotPinPage,
        builder: (context, state) => ForgotPinPage(),
      ),
      GoRoute(
        path: PagePath.guestLoginPage,
        builder: (context, state) => GuestLoginPage(),
      ),
    ],
  );
}

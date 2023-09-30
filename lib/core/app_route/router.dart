import 'package:book_store/core/app_route/routes.dart';
import 'package:book_store/feature/auth/business_logic/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feature/auth/business_logic/register_cubit/register_cubit.dart';
import '../../feature/auth/date/repo/auth_repo.dart';
import '../../feature/auth/presentation/screens/login_screen.dart';
import '../../feature/auth/presentation/screens/register_screen.dart';
import '../../feature/bottom_navigation_bar/view/screen/bottom_navigation_bar.dart';
import '../../feature/onboarding/View/Pages/onboarding.dart';
import '../../feature/splash_screen/splash_screen.dart';
import '../../injection.dart';
import '../local_database/secure_storage.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.onBoardingScreen:
      return MaterialPageRoute(
        builder: (context) => const OnBoarding(),
        settings: settings,
      );

    case AppRoutes.loginScreen:
      return MaterialPageRoute(
        builder: (_) =>
            BlocProvider(
              create: (context) => LoginCubit(getIt.get<AuthRepo>(), getIt.get<SecureStorage>()),
              child: const LoginScreen(),
            ),
        settings: settings,
      );

  case AppRoutes.registerScreen:
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (_) =>
            RegisterCubit(getIt.get<AuthRepo>(), getIt.get<SecureStorage>()),
        child: const RegisterScreen(),
      ),
      settings: settings,
    );

  case AppRoutes.bottomNavbar:
    return MaterialPageRoute(
      builder: (context) => const BottomNavbar(),
      settings: settings,
    );



    default:
      return MaterialPageRoute(
        builder: (_) =>  const SplashScreen(),
        settings: settings,
      );
  }
}

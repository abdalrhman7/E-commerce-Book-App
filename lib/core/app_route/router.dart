import 'package:book_store/core/app_route/routes.dart';
import 'package:book_store/feature/auth/business_logic/login_cubit/login_cubit.dart';
import 'package:book_store/feature/checkout/business_logic/checkout_model/checkout_cubit.dart';
import 'package:book_store/feature/checkout/data/repo/checkout_repo.dart';
import 'package:book_store/feature/my_order/data/repo/my_order_repo.dart';
import 'package:book_store/feature/my_order/presentation/screen/my_order_screen.dart';
import 'package:book_store/feature/product_details/business_logic/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:book_store/feature/product_details/data/repo/product_details_repo.dart';
import 'package:book_store/feature/profile/data/repo/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feature/auth/business_logic/register_cubit/register_cubit.dart';
import '../../feature/auth/date/repo/auth_repo.dart';
import '../../feature/auth/presentation/screens/login_screen.dart';
import '../../feature/auth/presentation/screens/register_screen.dart';
import '../../feature/bottom_navigation_bar/screen/bottom_navigation_bar.dart';
import '../../feature/checkout/presentation/screen/cheakout_screen.dart';
import '../../feature/my_order/business_logic/my_order_cubit/my_order_cubit.dart';
import '../../feature/onboarding/View/Pages/onboarding.dart';
import '../../feature/product_details/business_logic/favorite_cubit/favorite_cubit.dart';
import '../../feature/product_details/presentation/screen/product_details_screen.dart';
import '../../feature/profile/business_logic/update_profile_cubit/update_profile_cubit.dart';
import '../../feature/profile/presentation/screen/update_profile_info_screen.dart';
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
        builder: (_) => BlocProvider(
          create: (context) =>
              LoginCubit(getIt.get<AuthRepo>(), getIt.get<SecureStorage>()),
          child:  LoginScreen(),
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

    case AppRoutes.detailsScreen:
      final args = settings.arguments as Map<String, dynamic>;
      final product = args['product'];
      return MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<AddToCartCubit>(
              create: (BuildContext context) => AddToCartCubit(
                getIt.get<ProductDetailsRepo>(),
              ),
            ),
            BlocProvider<FavoriteCubit>(
              create: (BuildContext context) => FavoriteCubit(
                getIt.get<ProductDetailsRepo>(),
                getIt.get<SecureStorage>(),
              ),
            ),
          ],
          child: ProductDetailsScreen(product: product),
        ),
        settings: settings,
      );

    case AppRoutes.checkoutScreen:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => CheckoutCubit(getIt.get<CheckoutRepo>())
            ..getCheckoutTotalPrice()
            ..getUserInfo()
            ..getGovernorates(),
          child: const CheckoutScreen(),
        ),
        settings: settings,
      );

    case AppRoutes.myOrderScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) =>
              MyOrderCubit(getIt.get<MyOrderRepo>())..getMyOrders(),
          child: const MyOrderScreen(),
        ),
        settings: settings,
      );

    case AppRoutes.updateProfileInfo:
      // final args = settings.arguments as Map<String, dynamic>;
      // final cubit = args['cubit'];
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => UpdateProfileCubit(getIt.get<ProfileRepo>()),
          child: const UpdateProfileInfoScreen(),
        ),
        settings: settings,
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
        settings: settings,
      );
  }
}

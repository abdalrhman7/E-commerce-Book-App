import 'package:book_store/core/local_database/secure_storage.dart';
import 'package:book_store/feature/auth/business_logic/logout_cubit/logout_cubit.dart';
import 'package:book_store/feature/auth/date/repo/auth_repo.dart';
import 'package:book_store/feature/books/business_logic/get_all_books_cubit/get_all_books_cubit.dart';
import 'package:book_store/feature/books/data/repo/books_repo.dart';
import 'package:book_store/feature/cart/data/repo/cart_repo.dart';
import 'package:book_store/feature/favorite/data/repo/favorite_repo.dart';
import 'package:book_store/feature/home/business_logic/best_seller_cubit/best_seller_cubit.dart';
import 'package:book_store/feature/home/business_logic/new_arrival_cubit/new_arrival_cubit.dart';
import 'package:book_store/feature/profile/data/repo/profile_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../../books/presentation/screen/book_screen.dart';
import '../../../cart/business_logic/cart_cubit/cart_cubit.dart';
import '../../../cart/presentation/screen/cart_screen.dart';
import '../../../favorite/business_logic/get_favorite_cubit/get_favorite_cubit.dart';
import '../../../favorite/view/screen/favorite_screen.dart';
import '../../../home/business_logic/category_cubit/category_cubit.dart';
import '../../../home/date/repo/home_repo.dart';
import '../../../home/view/screen/home_screen.dart';
import '../../../product_details/data/repo/product_details_repo.dart';
import '../../../profile/business_logic/profile_info_cubit/profile_info_cubit.dart';
import '../../../profile/business_logic/update_profile_cubit/update_profile_cubit.dart';
import '../../../profile/presentation/screen/profile_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final _bottomNavbarController = PersistentTabController();

  List<Widget> _buildScreens() {
    return [
      blocProviderHomeScreen(),
      blocProviderBookScreen(),
      blocProviderCartScreen(),
      blocProviderFavoriteScreen(),
      blocProviderProfileScreen(),
    ];
  }

  Widget blocProviderHomeScreen() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BestSellerCubit>(
            create: (BuildContext context) =>
                BestSellerCubit(getIt.get<HomeRepo>())..getBestSeller()),
        BlocProvider<NewArrivalCubit>(
            create: (BuildContext context) =>
                NewArrivalCubit(getIt.get<HomeRepo>())..getNewArrival()),
        BlocProvider<CategoryCubit>(
            create: (BuildContext context) =>
                CategoryCubit(getIt.get<HomeRepo>())..getBestSeller()),
      ],
      child: const HomeScreen(),
    );
  }

  Widget blocProviderBookScreen() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetAllBooksCubit>(
          create: (BuildContext context) =>
              GetAllBooksCubit(getIt.get<BookRepo>())..getAllBooksCubit(),
        ),
      ],
      child: const BookScreen(),
    );
  }

  Widget blocProviderCartScreen() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(
          create: (BuildContext context) =>
              CartCubit(getIt.get<CartRepo>())
                ..getAllCart(),
        ),
      ],
      child: const CartScreen(),
    );
  }

  Widget blocProviderFavoriteScreen() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetFavoriteCubit>(
          create: (BuildContext context) =>
          GetFavoriteCubit(getIt.get<FavoriteRepo>() , getIt.get<ProductDetailsRepo>())..getFavorite(),
        ),
      ],
      child: const FavoriteScreen(),
    );
  }


  Widget blocProviderProfileScreen() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LogoutCubit>(
          create: (BuildContext context) =>
              LogoutCubit(getIt.get<AuthRepo>(), getIt.get<SecureStorage>()),
        ),
        BlocProvider<ProfileInfoCubit>(
          create: (BuildContext context) => ProfileInfoCubit(
              getIt.get<ProfileRepo>())
            ..getProfileInfo(),
        ),
        BlocProvider<UpdateProfileCubit>(
          create: (BuildContext context) => UpdateProfileCubit(
              getIt.get<ProfileRepo>()),
        ),
      ],
      child: const ProfileScreen(),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        title: 'Books',
        icon: const Icon(Icons.book),
        activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart_outlined),
        title: ("Cart"),
        activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_border),
        title: ("Favorite"),
        activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Account"),
        activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  PersistentTabView _persistentTabView() {
    return PersistentTabView(
      context,
      controller: _bottomNavbarController,
      stateManagement: true,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.grey,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _persistentTabView(),
    );
  }
}

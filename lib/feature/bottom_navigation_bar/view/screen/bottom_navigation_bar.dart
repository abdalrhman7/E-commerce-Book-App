import 'package:book_store/feature/home/business_logic/best_seller_cubit/best_seller_cubit.dart';
import 'package:book_store/feature/home/business_logic/new_arrival_cubit/new_arrival_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../../home/business_logic/category_cubit/category_cubit.dart';
import '../../../home/date/repo/home_repo.dart';
import '../../../home/view/screen/home_screen.dart';

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
      Container(),
      Container(),
      Container(),
      Container(),
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
        icon: const Icon(Icons.favorite_border),
        title: ("Favorite"),
        activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart_outlined),
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

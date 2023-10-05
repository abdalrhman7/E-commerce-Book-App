import 'package:book_store/core/app_route/routes.dart';
import 'package:book_store/core/constants/app_color.dart';
import 'package:book_store/feature/profile/business_logic/profile_info_cubit/profile_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/text_style.dart';
import '../widget/ogout_button_bloc_listener.dart';
import '../widget/profile_info.dart';
import '../widget/profile_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 12.r),
        child: RefreshIndicator(
          color: kMainColor,
          onRefresh: () {
            return BlocProvider.of<ProfileInfoCubit>(context).getProfileInfo();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LogoutButtonBlocListener(),
                Text(
                  'My Profile',
                  style:
                      Style.textStyle28.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 22.h),
                const ProfileInfo(),
                SizedBox(height: 36.h),
                ProfileListTile(
                  text: 'Update Profile',
                  info: 'Update Profile Info',
                  onTap: () => Navigator.of(context, rootNavigator: true)
                      .pushNamed(AppRoutes.updateProfileInfo),
                ),
                SizedBox(height: 10.h),
                ProfileListTile(
                  text: 'My order',
                  info: 'Already have 12 orders',
                  onTap: () => Navigator.of(context, rootNavigator: true)
                      .pushNamed(AppRoutes.myOrderScreen),
                ),
                SizedBox(height: 10.h),
                const ProfileListTile(
                  text: 'Payment method',
                  info: 'Visa **34',
                ),
                SizedBox(height: 10.h),
                const ProfileListTile(
                  text: 'Promocodes',
                  info: 'You have special promocodes',
                ),
                SizedBox(height: 10.h),
                const ProfileListTile(
                  text: 'My reviews',
                  info: 'Reviews for 5 items',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

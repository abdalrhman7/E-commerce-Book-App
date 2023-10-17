import 'package:book_store/feature/profile/business_logic/profile_info_cubit/profile_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_style.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
      builder: (context, state) {
        if (state is ProfileInfoSuccess) {
          return Column(
            children: [
              buildProfileMainInfo(state),
            ],
          );
        } else if (state is ProfileInfoError) {
          return Center(child: Text(state.errMessage));
        }
        return const SizedBox();
      },
    );
  }

  Widget buildProfileMainInfo(ProfileInfoSuccess state) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                state.profileInfo.image!,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.profileInfo.name!,
              style: Style.textStyle18,
            ),
            Text(
              state.profileInfo.email!,
              style: Style.textStyle16.copyWith(color: Colors.grey.shade700),
            ),
          ],
        ),
      ],
    );
  }
}

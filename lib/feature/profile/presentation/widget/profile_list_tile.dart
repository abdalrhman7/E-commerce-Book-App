import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/text_style.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.text,
    required this.info,
    this.onTap,
  });
  final String text;
  final String info;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: Style.textStyle16.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6.h),
          Text(
            info,
            style: Style.textStyle12.copyWith(color: greyText),
          ),
        ],
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_sharp,
        color: greyText,
        size: 16,
      ),
    );
  }
}
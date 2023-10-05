import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/text_style.dart';
import '../../../../core/widgets/search_bar_widget.dart';
import '../widget/Favorite_list_bloc_consumer.dart';
import '../widget/buildFilterRow.dart';
import '../widget/filter_list_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBarWidget(),
            SizedBox(height: 8.h),
            Text(
              'Favorites',
              style: Style.textStyle28.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            const BooksTypeListView(),
            SizedBox(height: 16.h),
            const BuildFilterRow(),
            SizedBox(height: 16.h),
            const FavoriteListBlocConsumer(),
            SizedBox(height: 12.h)
          ],
        ),
      ),
    );
  }
}

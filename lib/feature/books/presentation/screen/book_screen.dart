import 'package:book_store/core/widgets/CustomCircularProgressIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/get_books_cubit/get_books_cubit.dart';
import '../widget/books_grid_view.dart';
import '../widget/search_bar_widget.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          children: [
            const BooksSearchBar(),
            SizedBox(height: 10.h),
            BlocBuilder<GetBooksCubit, GetBooksState>(
              builder: (context, state) {
                if (state is GetBooksError) {
                  return Center(
                    child: Text(state.errMessage),
                  );
                } else if (state is GetBooksSuccess) {
                  return BooksGridView(state: state);
                }
                return const CustomCircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

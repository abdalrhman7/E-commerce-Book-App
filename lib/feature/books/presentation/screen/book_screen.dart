import 'package:book_store/core/widgets/CustomCircularProgressIndicator.dart';
import 'package:book_store/feature/books/business_logic/get_all_books_cubit/get_all_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/view/widget/products_items.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<GetAllBooksCubit, GetAllBooksState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          if (state is GetAllBooksError) {
            return Center(
              child: Text(state.errMessage),
            );
          } else if (state is GetAllBooksSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: state.book.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 20 / 27,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (context, index) =>
                          ProductItem(product: state.book[index]),
                    ),
                  ),
                ],
              ),
            );
          }
          return const CustomCircularProgressIndicator();
        },
      ),
    );
  }
}

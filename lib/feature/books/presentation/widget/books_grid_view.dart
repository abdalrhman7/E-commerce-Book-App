import 'package:flutter/material.dart';

import '../../../home/view/widget/products_items.dart';
import '../../business_logic/get_books_cubit/get_books_cubit.dart';

class BooksGridView extends StatelessWidget {
  const BooksGridView({
    super.key, required this.state,
  });
  final GetBooksSuccess state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
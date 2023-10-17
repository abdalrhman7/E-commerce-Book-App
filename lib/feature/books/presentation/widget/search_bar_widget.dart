import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/get_books_cubit/get_books_cubit.dart';

class BooksSearchBar extends StatelessWidget {
  const BooksSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<GetBooksCubit>(context);
    return TextField(
      decoration: const InputDecoration(
        icon: Icon(Icons.search),
        labelText: "Search for Books",
        labelStyle: TextStyle(color: Colors.grey),
      ),
      onChanged: (text) {
        cubit.searchBooks(searchKeyWord: text);
      },
      onSubmitted: (value) {
        cubit.searchBooks(searchKeyWord: value);
      },
    );
  }
}
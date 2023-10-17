import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../home/date/model/products.dart';
import '../../data/repo/books_repo.dart';

part 'get_books_state.dart';

class GetBooksCubit extends Cubit<GetBooksState> {
  GetBooksCubit(this.bookRepo) : super(GetBooksInitial());

  final BookRepo bookRepo;


  void searchBooks({required String searchKeyWord}) {
    emit(GetBooksLoading());
    bookRepo
        .searchBooks(searchKeyWord: searchKeyWord)
        .then(
          (value) => emit(GetBooksSuccess(value)),
    )
        .catchError((onError) => emit(GetBooksError(onError.toString())));
  }


  void getAllBooksCubit() {
    emit(GetBooksLoading());
    bookRepo
        .getAllBooks()
        .then(
          (value) => emit(GetBooksSuccess(value)),
        )
        .catchError((onError) => emit(GetBooksError(onError.toString())));
  }
}

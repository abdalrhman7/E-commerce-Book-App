import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../home/date/model/products.dart';
import '../../data/repo/books_repo.dart';

part 'get_all_books_state.dart';

class GetAllBooksCubit extends Cubit<GetAllBooksState> {
  GetAllBooksCubit(this.bookRepo) : super(GetAllBooksInitial());

  final BookRepo bookRepo;

  void getAllBooksCubit() {
    emit(GetAllBooksLoading());
    bookRepo
        .getAllBooks()
        .then(
          (value) => emit(GetAllBooksSuccess(value)),
        )
        .catchError((onError) => emit(GetAllBooksError(onError.toString())));
  }
}

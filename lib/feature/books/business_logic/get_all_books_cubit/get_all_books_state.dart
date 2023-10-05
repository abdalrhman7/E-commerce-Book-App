part of 'get_all_books_cubit.dart';

@immutable
abstract class GetAllBooksState {}

class GetAllBooksInitial extends GetAllBooksState {}

class GetAllBooksLoading extends GetAllBooksState {}

class GetAllBooksSuccess extends GetAllBooksState {
  final List<Books> book;

  GetAllBooksSuccess(this.book);
}

class GetAllBooksError extends GetAllBooksState {
  final String errMessage;

  GetAllBooksError(this.errMessage);
}

part of 'get_books_cubit.dart';

@immutable
abstract class GetBooksState {}

class GetBooksInitial extends GetBooksState {}

class GetBooksLoading extends GetBooksState {}

class SearchSuccess extends GetBooksState {}

class GetBooksSuccess extends GetBooksState {
  final List<Books> book;

  GetBooksSuccess(this.book);
}

class GetBooksError extends GetBooksState {
  final String errMessage;

  GetBooksError(this.errMessage);
}

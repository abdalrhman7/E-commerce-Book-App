part of 'get_favorite_cubit.dart';

@immutable
abstract class GetFavoriteState {}

class GetFavoriteInitial extends GetFavoriteState {}

class GetFavoriteLoading extends GetFavoriteState {}

class GetFavoriteSuccess extends GetFavoriteState {
  final List<Books> favorites;

  GetFavoriteSuccess(this.favorites);
}

class GetFavoriteError extends GetFavoriteState {
  final String errorMessage;

  GetFavoriteError(this.errorMessage);
}

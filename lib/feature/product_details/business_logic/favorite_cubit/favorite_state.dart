part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class AddToFavoriteInitial extends FavoriteState {}


class AddToFavoriteSuccess extends FavoriteState {}

class AddToFavoriteError extends FavoriteState {}

class RemoveFromFavoriteError extends FavoriteState {}

class RemoveFromFavoriteSuccess extends FavoriteState {}

part of 'new_arrival_cubit.dart';

@immutable
abstract class NewArrivalState {}

class NewArrivalInitial extends NewArrivalState {}

class NewArrivalLoading extends NewArrivalState {}

class NewArrivalSuccess extends NewArrivalState {
  final List<Products> products;

  NewArrivalSuccess(this.products);
}

class NewArrivalError extends NewArrivalState {
  final String errMessage;

  NewArrivalError(this.errMessage);
}

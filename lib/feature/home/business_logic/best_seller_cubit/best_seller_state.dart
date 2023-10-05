part of 'best_seller_cubit.dart';

@immutable
abstract class BestSellerState {}

class BestSellerInitial extends BestSellerState {}

class BestSellerLoading extends BestSellerState {}

class BestSellerSuccess extends BestSellerState {
  final List<Books> products;

  BestSellerSuccess(this.products);
}

class BestSellerError extends BestSellerState {
  final String errMessage;

  BestSellerError(this.errMessage);
}

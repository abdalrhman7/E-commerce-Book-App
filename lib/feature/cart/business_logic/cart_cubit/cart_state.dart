part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class GetCartLoading extends CartState {}

class GetCartSuccess extends CartState {
  final List<CartItems> carts;

  GetCartSuccess(this.carts);
}

class GetCartError extends CartState {
  final String errMessage;

  GetCartError(this.errMessage);
}

class GetTotalPriceLoading extends CartState {}

class GetTotalPriceSuccess extends CartState {
  final String totalPrice;

  GetTotalPriceSuccess(this.totalPrice);
}

class UpdateQuantityLoading extends CartState {}

class UpdateQuantitySuccess extends CartState {
  final int itemQuantity;

  UpdateQuantitySuccess(this.itemQuantity);
}

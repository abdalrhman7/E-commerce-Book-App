part of 'checkout_cubit.dart';

@immutable
abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class GetUserInfoLoading extends CheckoutState {}

class GetUserInfoSuccess extends CheckoutState {
  final User user;

  GetUserInfoSuccess(this.user);
}

class GetUserInfoError extends CheckoutState {
  final String errMessage;

  GetUserInfoError(this.errMessage);
}

class GetTotalPriceLoading extends CheckoutState {}

class GetTotalPriceSuccess extends CheckoutState {
  final String price;

  GetTotalPriceSuccess(this.price);
}

class GetTotalPriceError extends CheckoutState {
  final String errMessage;

  GetTotalPriceError(this.errMessage);
}

class GetGovernoratesLoading extends CheckoutState {}

class GetGovernoratesSuccess extends CheckoutState {
  final List<GovernoratesModel> governorates;

  GetGovernoratesSuccess(this.governorates);
}

class GetGovernoratesError extends CheckoutState {
  final String errMessage;

  GetGovernoratesError(this.errMessage);
}

class SubmitOrderLoading extends CheckoutState {}

class SubmitOrderSuccess extends CheckoutState {}

class SubmitOrderError extends CheckoutState {
  final String errorMessage;

  SubmitOrderError(this.errorMessage);
}

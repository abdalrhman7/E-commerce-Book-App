part of 'my_order_cubit.dart';

@immutable
abstract class MyOrderState {}

class MyOrderInitial extends MyOrderState {}

class GetMyOrderLoading extends MyOrderState {}

class GetMyOrderSuccess extends MyOrderState {
final  List<MyOrderModel> myOrders ;

  GetMyOrderSuccess(this.myOrders);
}

class GetMyOrderError extends MyOrderState {
  final String errorMessage;

  GetMyOrderError(this.errorMessage);
}

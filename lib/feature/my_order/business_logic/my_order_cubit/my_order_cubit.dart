import 'package:bloc/bloc.dart';
import 'package:book_store/feature/my_order/data/repo/my_order_repo.dart';
import 'package:meta/meta.dart';

import '../../data/model/my_order_model.dart';

part 'my_order_state.dart';

class MyOrderCubit extends Cubit<MyOrderState> {
  MyOrderCubit(this.myOrderRepo) : super(MyOrderInitial());

  final MyOrderRepo myOrderRepo;

  void getMyOrders() {
    emit(GetMyOrderLoading());
    myOrderRepo
        .getMyOrders()
        .then((value) => emit(GetMyOrderSuccess(value)))
        .catchError(
          (onError) => GetMyOrderError(onError.toString()),
        );
  }
}

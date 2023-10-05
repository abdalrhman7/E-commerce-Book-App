import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/cheackout_model.dart';
import '../../data/model/governorates_model.dart';
import '../../data/model/placeorder_model.dart';
import '../../data/repo/checkout_repo.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.checkoutRepo) : super(CheckoutInitial());

  final CheckoutRepo checkoutRepo;

  String? selectedCity;
  late String userName;
  late String phone;
  late String address;
  late String email;

  void getUserInfo() {
    emit(GetUserInfoLoading());
    checkoutRepo.getUserInfo().then((value) {
      emit(GetUserInfoSuccess(value));
    }).catchError(
      (onError) {
        emit(GetUserInfoError(onError.toString()));
      },
    );
  }

  void getCheckoutTotalPrice() {
    emit(GetTotalPriceLoading());
    checkoutRepo
        .getCheckoutTotalPrice()
        .then((value) => emit(GetTotalPriceSuccess(value)))
        .catchError(
      (onError) {
        emit(GetTotalPriceError(onError.toString()));
      },
    );
  }

  void getGovernorates() {
    emit(GetGovernoratesLoading());
    checkoutRepo
        .getGovernorates()
        .then((value) => emit(GetGovernoratesSuccess(value)))
        .catchError(
      (onError) {
        emit(GetGovernoratesError(onError.toString()));
      },
    );
  }

  void submitOrder(SubmitOrder submitOrder) async {
    emit(SubmitOrderLoading());
    try {
      await checkoutRepo.submitOrder(submitOrder);
      emit(SubmitOrderSuccess());
    } catch (e) {
      emit(SubmitOrderError(e.toString()));
    }
  }
}

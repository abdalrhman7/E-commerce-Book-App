import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/cart_model.dart';
import '../../data/repo/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());

  final CartRepo cartRepo;

  Future<void> getAllCart() async {
    emit(GetCartLoading());
    cartRepo.getAllCartItems().then((value) {
      emit(GetCartSuccess(value));
      getTotalPrice();
    }).catchError(
      (onError) {
        emit(
          GetCartError(onError.toString()),
        );
      },
    );
  }

  Future<void> getTotalPrice() async {
    GetTotalPriceLoading();
    cartRepo.getTotalPrice().then((value) {
      emit(GetTotalPriceSuccess(value));
    });
  }


  ///TODO: getAllCart
  Future<void> updateQuantity({
    required int itemId,
    required int quantity,
    required bool isIncrement,
  }) async {
    emit(UpdateQuantityLoading());
    isIncrement ? quantity++ : quantity--;
    cartRepo.updateCart(itemId, quantity);
  }


  Future<void> removeFromCart(int itemId) async {
    cartRepo.removeFromCart(itemId).then((_) => getAllCart());
  }
}

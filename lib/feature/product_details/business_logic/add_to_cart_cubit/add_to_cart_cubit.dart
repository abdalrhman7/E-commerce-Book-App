import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repo/product_details_repo.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this.productDetailsRepo)
      : super(AddToCartInitial());

  final ProductDetailsRepo productDetailsRepo;

  void addToCart({required int productId}) async {
    emit(AddToCartLoading());
    productDetailsRepo
        .addToCart(productId: productId)
        .then((_) => emit(AddToCartSuccess()))
        .catchError((_) => emit(AddToCartError()));
  }
}

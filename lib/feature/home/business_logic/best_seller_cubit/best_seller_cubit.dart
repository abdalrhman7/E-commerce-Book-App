import 'package:bloc/bloc.dart';
import 'package:book_store/feature/home/date/repo/home_repo.dart';
import 'package:meta/meta.dart';

import '../../date/model/products.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this.homeRepo) : super(BestSellerInitial());

  final HomeRepo homeRepo;

  void getBestSeller() {
    emit(BestSellerLoading());
    homeRepo
        .getBestSeller()
        .then(
          (value) => emit(BestSellerSuccess(value)),
        )
        .catchError((onError) => emit(BestSellerError(onError.toString())));
  }
}

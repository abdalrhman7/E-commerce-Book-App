import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/local_database/secure_storage.dart';
import '../../data/repo/product_details_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.productDetailsRepo, this.secureStorage)
      : super(AddToFavoriteInitial());

  final ProductDetailsRepo productDetailsRepo;
  final SecureStorage secureStorage;
  bool isFavorite = false;

  void addToFavorite({required int productId}) async {
    productDetailsRepo
        .addToFavorite(productId: productId)
        .then((_) {
      isFavorite = true;
      emit(AddToFavoriteSuccess());
    }).catchError((_) {
      emit(AddToFavoriteError());
    });
  }

  void removeFromFavorite({required int productId}) async {
    productDetailsRepo
        .removeFromFavorite(productId: productId)
        .then((_) {
      isFavorite = false;
      emit(RemoveFromFavoriteSuccess());
    }).catchError((_) {
      emit(RemoveFromFavoriteError());
    });
  }
}

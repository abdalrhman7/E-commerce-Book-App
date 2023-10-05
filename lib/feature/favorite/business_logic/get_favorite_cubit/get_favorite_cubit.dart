import 'package:bloc/bloc.dart';
import 'package:book_store/feature/favorite/data/repo/favorite_repo.dart';
import 'package:meta/meta.dart';

import '../../../home/date/model/products.dart';
import '../../../product_details/data/repo/product_details_repo.dart';

part 'get_favorite_state.dart';

class GetFavoriteCubit extends Cubit<GetFavoriteState> {
  GetFavoriteCubit(this.favoriteRepo, this.productDetailsRepo)
      : super(GetFavoriteInitial());

  final FavoriteRepo favoriteRepo;
  final ProductDetailsRepo productDetailsRepo;

  void getFavorite() async {
    emit(GetFavoriteLoading());
    favoriteRepo
        .getFavorite()
        .then(
          (value) => emit(GetFavoriteSuccess(value)),
        )
        .catchError(
          (onError) => emit(GetFavoriteError(onError.toString())),
        );
  }

  void removeFromFavorite({required int productId}) async {
    productDetailsRepo
        .removeFromFavorite(productId: productId)
        .then((_) => getFavorite());
  }
}

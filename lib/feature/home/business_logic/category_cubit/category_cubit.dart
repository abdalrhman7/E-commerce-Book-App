import 'package:bloc/bloc.dart';
import 'package:book_store/feature/home/date/repo/home_repo.dart';
import 'package:meta/meta.dart';

import '../../date/model/Category.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.homeRepo) : super(CategoryInitial());

  final HomeRepo homeRepo;

  void getBestSeller() {
    emit(CategoryLoading());
    homeRepo
        .getCategories()
        .then(
          (value) => emit(CategorySuccess(value)),
        )
        .catchError((onError) => emit(CategoryError(onError.toString())));
  }
}

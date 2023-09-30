import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../date/model/products.dart';
import '../../date/repo/home_repo.dart';

part 'new_arrival_state.dart';

class NewArrivalCubit extends Cubit<NewArrivalState> {
  NewArrivalCubit(this.homeRepo) : super(NewArrivalInitial());
  final HomeRepo homeRepo;

  void getNewArrival() {
    emit(NewArrivalLoading());
    homeRepo
        .getNewArrival()
        .then(
          (value) => emit(NewArrivalSuccess(value)),
        )
        .catchError((onError) => emit(NewArrivalError(onError.toString())));
  }
}

import 'package:book_store/feature/home/business_logic/category_cubit/category_cubit.dart';
import 'package:book_store/feature/home/business_logic/new_arrival_cubit/new_arrival_cubit.dart';
import 'package:book_store/feature/home/date/model/Category.dart';
import 'package:get_it/get_it.dart';
import 'core/network/setup_dio.dart';
import 'core/network/wep_services.dart';
import 'core/local_database/secure_storage.dart';
import 'feature/auth/business_logic/login_cubit/login_cubit.dart';
import 'feature/auth/business_logic/register_cubit/register_cubit.dart';
import 'feature/auth/date/repo/auth_repo.dart';
import 'feature/home/business_logic/best_seller_cubit/best_seller_cubit.dart';
import 'feature/home/date/repo/home_repo.dart';


final getIt = GetIt.instance;

void initGetIt() async {
  ///Bloc
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt(), getIt()));
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt() ,getIt()));
  getIt.registerLazySingleton<BestSellerCubit>(() => BestSellerCubit(getIt()));
  getIt.registerLazySingleton<NewArrivalCubit>(() => NewArrivalCubit(getIt()));
  getIt.registerLazySingleton<CategoryCubit>(() => CategoryCubit(getIt()));


  ///Repo
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));


  ///Wep_Services
  getIt
      .registerLazySingleton<WebService>(() => WebService(createAndSetupDio()));

  ///Local_data
  getIt.registerLazySingleton<SecureStorage>(() => SecureStorage());
}

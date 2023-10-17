import 'package:book_store/feature/auth/business_logic/logout_cubit/logout_cubit.dart';
import 'package:book_store/feature/books/data/repo/books_repo.dart';
import 'package:book_store/feature/favorite/data/repo/favorite_repo.dart';
import 'package:book_store/feature/home/business_logic/category_cubit/category_cubit.dart';
import 'package:book_store/feature/home/business_logic/new_arrival_cubit/new_arrival_cubit.dart';
import 'package:book_store/feature/my_order/business_logic/my_order_cubit/my_order_cubit.dart';
import 'package:book_store/feature/my_order/data/repo/my_order_repo.dart';
import 'package:book_store/feature/product_details/business_logic/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:book_store/feature/profile/business_logic/profile_info_cubit/profile_info_cubit.dart';
import 'package:book_store/feature/profile/data/repo/profile_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'core/network/setup_dio.dart';
import 'core/network/wep_services.dart';
import 'core/local_database/secure_storage.dart';
import 'feature/auth/business_logic/login_cubit/login_cubit.dart';
import 'feature/auth/business_logic/register_cubit/register_cubit.dart';
import 'feature/auth/date/repo/auth_repo.dart';
import 'feature/books/business_logic/get_books_cubit/get_books_cubit.dart';
import 'feature/cart/business_logic/cart_cubit/cart_cubit.dart';
import 'feature/cart/data/repo/cart_repo.dart';
import 'feature/checkout/business_logic/checkout_model/checkout_cubit.dart';
import 'feature/checkout/data/repo/checkout_repo.dart';
import 'feature/favorite/business_logic/get_favorite_cubit/get_favorite_cubit.dart';
import 'feature/home/business_logic/best_seller_cubit/best_seller_cubit.dart';
import 'feature/home/date/repo/home_repo.dart';
import 'feature/product_details/business_logic/favorite_cubit/favorite_cubit.dart';
import 'feature/product_details/data/repo/product_details_repo.dart';

final getIt = GetIt.instance;

void initGetIt() async {
  ///Auth
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt(), getIt()));
  getIt.registerLazySingleton<RegisterCubit>(
      () => RegisterCubit(getIt(), getIt()));
  getIt.registerLazySingleton<LogoutCubit>(() => LogoutCubit(getIt(), getIt()));
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt()));

  ///Home_screen
  getIt.registerLazySingleton<BestSellerCubit>(() => BestSellerCubit(getIt()));
  getIt.registerLazySingleton<NewArrivalCubit>(() => NewArrivalCubit(getIt()));
  getIt.registerLazySingleton<CategoryCubit>(() => CategoryCubit(getIt()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));

  ///Profile
  getIt
      .registerLazySingleton<ProfileInfoCubit>(() => ProfileInfoCubit(getIt()));

  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));

  ///my_order
  getIt.registerLazySingleton<MyOrderCubit>(() => MyOrderCubit(getIt()));
  getIt.registerLazySingleton<MyOrderRepo>(() => MyOrderRepo(getIt()));

  ///cart
  getIt.registerLazySingleton<CartCubit>(() => CartCubit(getIt()));
  getIt.registerLazySingleton<AddToCartCubit>(() => AddToCartCubit(getIt()));
  getIt.registerLazySingleton<CartRepo>(() => CartRepo(getIt()));

  ///Favorite
  getIt.registerLazySingleton<FavoriteRepo>(() => FavoriteRepo(getIt()));
  getIt.registerLazySingleton<GetFavoriteCubit>(
      () => GetFavoriteCubit(getIt(), getIt()));

  ///books
  getIt
      .registerLazySingleton<GetBooksCubit>(() => GetBooksCubit(getIt()));
  getIt.registerLazySingleton<BookRepo>(() => BookRepo(getIt()));

  ///product_details
  getIt.registerLazySingleton<ProductDetailsRepo>(
      () => ProductDetailsRepo(getIt()));

  getIt.registerLazySingleton<FavoriteCubit>(
      () => FavoriteCubit(getIt(), getIt()));

  ///Checkout
  getIt.registerLazySingleton<CheckoutCubit>(() => CheckoutCubit(getIt()));
  getIt.registerLazySingleton<CheckoutRepo>(() => CheckoutRepo(getIt()));

  ///Wep_Services
  getIt.registerLazySingleton<WebService>(() =>
      WebService(CreateAndSetupDio(getIt()).createAndSetupDio(), getIt()));

  getIt.registerSingleton<Dio>(Dio());

  ///Local_data
  getIt.registerLazySingleton<SecureStorage>(() => SecureStorage());
}

import 'package:http/http.dart';
import 'package:get_it/get_it.dart';
import 'package:scanner/Data/Config/api_client.dart';
import 'package:scanner/Data/Data_source/authentication_data_source.dart';
import 'package:scanner/Data/Data_source/product_local_data_source.dart';
import 'package:scanner/Data/Data_source/product_remote_data_source.dart';
import 'package:scanner/Data/Repository/authentication_repo_impl.dart';
import 'package:scanner/Data/Repository/product_repo_impl.dart';
import 'package:scanner/Domain/Repository/authentication_repo.dart';
import 'package:scanner/Domain/Repository/product_repo.dart';
import 'package:scanner/Domain/Usecase/Authentication/create_user_usecase.dart';
import 'package:scanner/Domain/Usecase/Product/get_product_local_usecase.dart';
import 'package:scanner/Domain/Usecase/Product/product_list_usecase.dart';
import 'package:scanner/Domain/Usecase/Product/remove_product_local_usecase.dart';
import 'package:scanner/Domain/Usecase/Product/save_product_local_usecase.dart';
import 'package:scanner/Presentation/Bloc/Authentication/authentication_bloc.dart';
import 'package:scanner/Presentation/Bloc/Product/product_bloc.dart';

final getItInstance = GetIt.instance;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  /// Data_source
  getItInstance.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationReomteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(getItInstance()));
      getItInstance.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl());

  /// Repository
  getItInstance.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepoImpl(getItInstance()));
  getItInstance.registerLazySingleton<ProductRepository>(
      () => ProductRepoImpl(getItInstance(), getItInstance()));

  /// Usecase
  getItInstance.registerLazySingleton<CreateUserUsecase>(
      () => CreateUserUsecase(getItInstance()));
  getItInstance.registerLazySingleton<ProductListUsecase>(
      () => ProductListUsecase(getItInstance()));
  getItInstance.registerLazySingleton<GetProductLocalUsecase>(
      () => GetProductLocalUsecase(getItInstance()));
  getItInstance.registerLazySingleton<SaveProductLocalUsecase>(
      () => SaveProductLocalUsecase(getItInstance()));
getItInstance.registerLazySingleton<RemoveProductFromLocal>(
      () => RemoveProductFromLocal(getItInstance()));
  /// Bloc
  getItInstance.registerFactory(() => AuthenticationCubit(getItInstance()));
  getItInstance.registerFactory(
      () => ProductCubit(getItInstance(), getItInstance(), getItInstance(),getItInstance()));
}

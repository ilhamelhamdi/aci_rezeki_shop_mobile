import 'package:aci_rezeki_shop_mobile/data/datasources/auth_datasource.dart';
import 'package:aci_rezeki_shop_mobile/data/datasources/item_remote_datasource.dart';
import 'package:aci_rezeki_shop_mobile/data/repositories/auth_repository.dart';
import 'package:aci_rezeki_shop_mobile/data/repositories/item_repository_impl.dart';
import 'package:aci_rezeki_shop_mobile/domain/repositories/auth_repository.dart';
import 'package:aci_rezeki_shop_mobile/domain/repositories/item_repository.dart';
import 'package:aci_rezeki_shop_mobile/domain/usecases/create_item_use_case.dart';
import 'package:aci_rezeki_shop_mobile/domain/usecases/get_item_detail_use_case.dart';
import 'package:aci_rezeki_shop_mobile/domain/usecases/get_item_list_use_case.dart';
import 'package:aci_rezeki_shop_mobile/domain/usecases/login_use_case.dart';
import 'package:aci_rezeki_shop_mobile/domain/usecases/logout_use_case.dart';
import 'package:aci_rezeki_shop_mobile/domain/usecases/register_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Network
  getIt.registerLazySingleton(() => CookieRequest());

  // Data sources
  getIt.registerLazySingleton(() => ItemRemoteDataSource(client: getIt()));
  getIt.registerLazySingleton(() => AuthDatasource(client: getIt()));

  // Repositories
  getIt.registerLazySingleton<ItemRepository>(
      () => ItemRepositoryImpl(datasource: getIt()));
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(datasource: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => LoginUseCase(authRepository: getIt()));
  getIt.registerLazySingleton(() => RegisterUseCase(authRepository: getIt()));
  getIt.registerLazySingleton(() => LogoutUseCase(authRepository: getIt()));

  getIt
      .registerLazySingleton(() => GetItemListUseCase(itemRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetItemDetailUseCase(itemRepository: getIt()));
  getIt.registerLazySingleton(() => CreateItemUseCase(itemRepository: getIt()));
}

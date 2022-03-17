import 'package:get_it/get_it.dart';
import 'package:sneakears_shop/data/repository/sneakers_repository.dart';

final sl = GetIt.instance;

void setup(){
  sl.registerLazySingleton<SneakersRepository>(() => SneakersRepositoryImpl());
}
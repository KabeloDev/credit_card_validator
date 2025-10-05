import 'package:credit_card_validator/features/card_validation/data/datasources/local_data_source.dart';
import 'package:credit_card_validator/features/card_validation/data/repositories/card_repository_impl.dart';
import 'package:credit_card_validator/features/card_validation/domain/repositories/card_repository.dart';
import 'package:credit_card_validator/features/card_validation/presentation/blocs/card_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;


Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => prefs);
  
  sl.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<CardRepository>(
    () => CardRepositoryImpl(localDataSource: sl(), prefs: sl()),
  );

  sl.registerFactory(() => CardBloc(repository: sl()));
}

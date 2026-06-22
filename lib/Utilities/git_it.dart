import 'package:get_it/get_it.dart';
import 'package:portfolio/Features/home/data/datasources/remote/remote_data_source.dart';
import 'package:portfolio/Features/home/data/datasources/remote/remote_data_source_imp.dart';
import 'package:portfolio/Features/home/data/repositories/repo_imp.dart';
import 'package:portfolio/Features/home/domain/repositories/repo.dart';
import 'package:portfolio/Features/home/domain/usecases/get_data_use_case.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class GitIt {
  static Future initGitIt() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(
      () => sharedPrefs,
    );

    _initPortfolio();
  }

  static void _initPortfolio() {
    sl.registerFactory(() => PortfolioCubit(getDataUseCase: sl()));
    sl.registerLazySingleton(() => GetDataUseCase(sl()));
    sl.registerLazySingleton<Repo>(
      () => RepoImp(
        sl(),
      ),
    );

    //! Data Sources
    sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImp(),
    );
  }
}

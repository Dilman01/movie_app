import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/data/repositories/movie_repository_imple.dart';
import 'package:movie_app/domain/repsitories/movie_repository.dart';
import 'package:movie_app/domain/usecases/get_coming_soon.dart';
import 'package:movie_app/domain/usecases/get_playing_now.dart';
import 'package:movie_app/domain/usecases/get_popular.dart';
import 'package:movie_app/domain/usecases/get_trending.dart';

final getItInstanse = GetIt.I;

Future init() async {
  getItInstanse.registerLazySingleton<Client>(() => Client());

// As, we’ve asked GetIt to initialize Client for us,
// so we rely on getItInstance() to provide Client to ApiClient instance.
  getItInstanse
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstanse()));

  getItInstanse.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstanse()));

  getItInstanse
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstanse()));

  getItInstanse
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstanse()));

  getItInstanse.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstanse()));

  getItInstanse.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstanse()));

  getItInstanse.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstanse()));
}

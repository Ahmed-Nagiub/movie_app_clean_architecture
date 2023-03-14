import 'package:get_it/get_it.dart';
import 'package:movie_app_ca/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app_ca/movies/data/repository/movies_repository.dart';
import 'package:movie_app_ca/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app_ca/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app_ca/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app_ca/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_app_ca/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// BLOC
    sl.registerLazySingleton(() => MoviesBloc(sl(),sl(),sl()));
    /// USE CASES
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    /// REPOSITORY
    sl.registerLazySingleton<BaseMovieRepository>(() =>
        MoviesRepository(baseMovieRemoteDataSource: sl()));
    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}

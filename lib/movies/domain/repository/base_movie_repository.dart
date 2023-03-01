import 'package:movie_app_ca/movies/domain/entities/movie.dart';

abstract class BaseMovieRepository {
  Future<List<Movies>> getNowPlaying();

  Future<List<Movies>> getPopularMovies();

  Future<List<Movies>> getTopRated();
}

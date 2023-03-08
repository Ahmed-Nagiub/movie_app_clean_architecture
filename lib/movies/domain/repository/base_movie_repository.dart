import 'package:dartz/dartz.dart';
import 'package:movie_app_ca/core/error/failure.dart';
import 'package:movie_app_ca/movies/domain/entities/movie.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure ,Iterable<Movies>>> getNowPlayingMovies();

  Future<Either<Failure ,Iterable<Movies>>> getPopularMovies();

  Future<Either<Failure ,Iterable<Movies>>> getTopRatedMovies();
}

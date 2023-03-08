import 'package:dartz/dartz.dart';
import 'package:movie_app_ca/core/error/failure.dart';
import 'package:movie_app_ca/movies/domain/entities/movie.dart';
import 'package:movie_app_ca/movies/domain/repository/base_movie_repository.dart';

class GetTopRatedMoviesUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMoviesUseCase(this.baseMovieRepository);

  Future<Either<Failure ,Iterable<Movies>>> execute()async{
    return await baseMovieRepository.getTopRatedMovies();
  }
}
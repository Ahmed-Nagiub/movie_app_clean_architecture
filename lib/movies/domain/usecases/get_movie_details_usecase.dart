import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_ca/core/error/failure.dart';
import 'package:movie_app_ca/core/usecase/base_usecase.dart';
import 'package:movie_app_ca/movies/domain/entities/movie_detail.dart';
import 'package:movie_app_ca/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetail, MovieDetailParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetail>?> call(
      MovieDetailParameters parameters) async {
    return await baseMovieRepository.getMovieDetails(parameters);
  }
}

class MovieDetailParameters extends Equatable {
  final int movieId;

  const MovieDetailParameters(this.movieId);

  @override
  List<Object> get props => [movieId];
}

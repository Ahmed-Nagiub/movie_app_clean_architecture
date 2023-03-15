import 'package:dartz/dartz.dart';
import 'package:movie_app_ca/core/error/exception.dart';
import 'package:movie_app_ca/core/error/failure.dart';
import 'package:movie_app_ca/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app_ca/movies/domain/entities/movie.dart';
import 'package:movie_app_ca/movies/domain/entities/movie_detail.dart';
import 'package:movie_app_ca/movies/domain/entities/recommendation.dart';
import 'package:movie_app_ca/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app_ca/movies/domain/usecases/get_recommendation_usecase.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';

class MoviesRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository({required this.baseMovieRemoteDataSource});

  @override
  Future<Either<Failure ,List<Movies>>> getNowPlayingMovies()async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result!.cast<Movies>());
    }on ServerException catch (failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    } 
  }

  @override
  Future<Either<Failure ,List<Movies>>> getPopularMovies() async{
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(result!.cast<Movies>());
    }on ServerException catch (failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure ,List<Movies>>> getTopRatedMovies() async{
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result!.cast<Movies>());
    }on ServerException catch (failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieDetailParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try{
      return Right(result!);
    }on ServerException catch (failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getRecommendation(parameters);
    try{
      return Right(result!);
    }on ServerException catch (failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

}

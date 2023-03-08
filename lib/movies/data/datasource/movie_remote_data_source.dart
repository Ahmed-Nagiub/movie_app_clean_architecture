import 'package:dio/dio.dart';
import 'package:movie_app_ca/core/error/exception.dart';
import 'package:movie_app_ca/core/network/api_constance.dart';
import 'package:movie_app_ca/core/network/error_message_model.dart';
import 'package:movie_app_ca/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<Iterable<MoviesModel>> getNowPlayingMovies();
  Future<Iterable<MoviesModel>> getPopularMovies();
  Future<Iterable<MoviesModel>> getTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {


  @override
  Future<Iterable<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from(response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e as Map<String, dynamic>));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.froJson(response.data));
    }
  }

  @override
  Future<Iterable<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from(response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e as Map<String, dynamic>));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.froJson(response.data));
    }
  }

  @override
  Future<Iterable<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from(response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e as Map<String, dynamic>));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.froJson(response.data));
    }
  }


}

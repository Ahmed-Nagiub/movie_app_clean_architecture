import 'package:dio/dio.dart';
import 'package:movie_app_ca/core/error/exception.dart';
import 'package:movie_app_ca/core/network/api_constance.dart';
import 'package:movie_app_ca/core/network/error_message_model.dart';
import 'package:movie_app_ca/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MoviesModel>?> getNowPlayingMovies();

  Future<List<MoviesModel>?> getPopularMovies();

  Future<List<MoviesModel>?> getTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MoviesModel>?> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    //print(response);
    if (response.statusCode == 200) {
      return List.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.froJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>?> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      return List.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.froJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>?> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.froJson(response.data));
    }
  }
}

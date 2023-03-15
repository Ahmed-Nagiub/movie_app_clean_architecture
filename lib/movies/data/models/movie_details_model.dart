import 'package:movie_app_ca/movies/data/models/genres_model.dart';
import 'package:movie_app_ca/movies/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail {
   const MovieDetailsModel({
    required super.backdropPath,
    required super.id,
    required super.voteAverage,
    required super.overView,
    required super.title,
    required super.runtime,
    required super.releaseDate,
    required super.genres,
  });
   factory MovieDetailsModel.fromJson(Map<String , dynamic> json)=>
       MovieDetailsModel(
         id: json["id"],
         title: json["title"],
         backdropPath: json["backdrop_path"],
         overView: json["overview"],
         runtime: json["runtime"],
         releaseDate: json["release_date"],
         voteAverage: json["vote_average"].toDouble(),
         genres: List<GenresModel>.from(json["genres"].map((x)=>GenresModel.fromJson(x))),
       );
}

import 'package:equatable/equatable.dart';
import 'package:movie_app_ca/movies/domain/entities/genres.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final int id;
  final double voteAverage;
  final String overView;
  final String title;
  final int runtime;
  final String releaseDate;
  final List<Genres> genres;

  const MovieDetail({
    required this.backdropPath,
    required this.id,
    required this.voteAverage,
    required this.overView,
    required this.title,
    required this.runtime,
    required this.releaseDate,
    required this.genres,
  });

  @override
  List<Object> get props => [
        backdropPath,
        id,
        voteAverage,
        overView,
        title,
        runtime,
        releaseDate,
        genres,
      ];
}

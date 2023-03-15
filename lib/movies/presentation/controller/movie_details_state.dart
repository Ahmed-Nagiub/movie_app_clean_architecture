import 'package:equatable/equatable.dart';
import 'package:movie_app_ca/core/utils/enums.dart';
import 'package:movie_app_ca/movies/domain/entities/movie_detail.dart';
import 'package:movie_app_ca/movies/domain/entities/recommendation.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailMessage = '',
    this.recommendation = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailsState,
    String? movieDetailMessage,
    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
        movieDetail: movieDetail ?? this.movieDetail,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
        recommendation: recommendation ?? this.recommendation,
        recommendationState: recommendationState ?? this.recommendationState,
        recommendationMessage: recommendationMessage ?? this.recommendationMessage);
  }

  final MovieDetail? movieDetail;
  final RequestState movieDetailsState;
  final String movieDetailMessage;
  final List<Recommendation> recommendation;

  final RequestState recommendationState;
  final String recommendationMessage;

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailsState,
        movieDetailMessage,
        recommendation,
        recommendationState,
        recommendationMessage,
      ];
}

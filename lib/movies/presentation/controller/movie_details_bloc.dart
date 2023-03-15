import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_ca/core/utils/enums.dart';
import 'package:movie_app_ca/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app_ca/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:movie_app_ca/movies/presentation/controller/movie_details_event.dart';
import 'package:movie_app_ca/movies/presentation/controller/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(MovieDetailParameters(event.id));

    result?.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetailsState: RequestState.loaded,
          movieDetail: r,
        ),
      ),
    );
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUseCase(RecommendationParameters(event.id));
    result?.fold(
          (l) => emit(
        state.copyWith(
          recommendationState: RequestState.error,
          recommendationMessage: l.message,
        ),
      ),
          (r) => emit(
        state.copyWith(
          recommendationState: RequestState.loaded,
          recommendation: r,
        ),
      ),
    );
  }
}

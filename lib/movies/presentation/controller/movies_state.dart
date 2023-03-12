import 'package:equatable/equatable.dart';
import 'package:movie_app_ca/core/utils/enums.dart';
import 'package:movie_app_ca/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movies> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
  });

  @override
  List<Object> get props => [nowPlayingMovies, nowPlayingState, nowPlayingMessage];
}

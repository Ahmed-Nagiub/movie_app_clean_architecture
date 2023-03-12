import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_ca/core/utils/enums.dart';
import 'package:movie_app_ca/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app_ca/movies/presentation/controller/movies_event.dart';
import 'package:movie_app_ca/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result =
          await getNowPlayingMoviesUseCase.execute();
      emit(MoviesState(nowPlayingState: RequestState.loaded));
      result?.fold(
          (l) => emit(MoviesState(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message)),
          (r) => emit(MoviesState(
              nowPlayingState: RequestState.loaded, nowPlayingMovies: r)));
    });
  }
}
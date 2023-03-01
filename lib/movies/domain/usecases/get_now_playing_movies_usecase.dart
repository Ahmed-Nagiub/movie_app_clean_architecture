import 'package:movie_app_ca/movies/domain/entities/movie.dart';
import 'package:movie_app_ca/movies/domain/repository/base_movie_repository.dart';

class GetNowPlayingMoviesUseCase{
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase(this.baseMovieRepository);

  Future<List<Movies>> execute() async{
    return await baseMovieRepository.getNowPlaying();
  }
}
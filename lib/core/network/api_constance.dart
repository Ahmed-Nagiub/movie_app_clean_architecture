class ApiConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '64e590369e6ae3144b7d6a0b0028049e';
  static const String nowPlayingMoviesPath = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviesPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviesPath = '$baseUrl/movie/top_rated?api_key=$apiKey';

}
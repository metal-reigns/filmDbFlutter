import 'package:flutter_application_2/configuration.dart';
import 'package:flutter_application_2/domain/api_client/movie_api_client.dart';
import 'package:flutter_application_2/domain/entity/popular_movie_response.dart';

class MovieService {
  final _movieApiClient = MovieApiClient();

  Future<PopularMovieResponse> popularMovie(int page, String locale) async {
    return _movieApiClient.popularMovie(page, locale, Configuration.apiKey);
  }

  Future<PopularMovieResponse> searchMovie(
    int page,
    String locale,
    String query,
  ) async {
    return _movieApiClient.searchMovie(
        page, locale, query, Configuration.apiKey);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/api_client/api_client.dart';
import 'package:flutter_application_2/domain/entity/movie.dart';
import 'package:flutter_application_2/ui/navigation/main_navigation.dart';
import 'package:intl/intl.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final List<Movie> _movies = [];
  List<Movie> get movies => List.unmodifiable(_movies);
  late DateFormat _dateFormat;
  String _local = '';

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  void setUpLocal(BuildContext context) {
    final local = Localizations.localeOf(context).toLanguageTag();
    if (_local == local) return;
    _local = local;
    _dateFormat = DateFormat.yMMMMd(local);
    _movies.clear();
    loadMovie();
  }

  Future<void> loadMovie() async {
    final moviesResponse = await _apiClient.popularMovie(1, 'us-US');
    _movies.addAll(moviesResponse.movies);
    notifyListeners();
  }

  onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.movieDetails,
      arguments: id,
    );
  }
}

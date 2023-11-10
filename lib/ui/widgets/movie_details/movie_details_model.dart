import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/api_client/api_client.dart';
import 'package:flutter_application_2/domain/entity/movie_details.dart';
import 'package:intl/intl.dart';

class MovieDetailsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  MovieDetails? _movieDetails;
  final int movieId;
  String _locale = '';
  late DateFormat _dateFormat;

  MovieDetails? get movieDetails => _movieDetails;

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  MovieDetailsModel(this.movieId);

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMd(locale);
    await loadDetails();
  }

  Future<void> loadDetails() async {
    _movieDetails = await _apiClient.movieDetails(movieId, _locale);
    notifyListeners();
  }
}

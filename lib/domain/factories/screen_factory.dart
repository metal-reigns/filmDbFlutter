import 'package:flutter/material.dart';
import 'package:flutter_app_movie_db/ui/widgets/auth/auth_model.dart';
import 'package:flutter_app_movie_db/ui/widgets/auth/auth_widget.dart';
import 'package:flutter_app_movie_db/ui/widgets/loader/loader_view_model.dart';
import 'package:flutter_app_movie_db/ui/widgets/loader/loader_widget.dart';
import 'package:flutter_app_movie_db/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter_app_movie_db/ui/widgets/movie_details/movie_details_model.dart';
import 'package:flutter_app_movie_db/ui/widgets/movie_details/movie_details_widget.dart';
import 'package:flutter_app_movie_db/ui/widgets/movie_list/movie_list_model.dart';
import 'package:flutter_app_movie_db/ui/widgets/movie_list/movie_list_widget.dart';
import 'package:flutter_app_movie_db/ui/widgets/movie_trailer/movie_trailer_widget.dart';
import 'package:flutter_app_movie_db/ui/widgets/news/new_widget.dart';
import 'package:flutter_app_movie_db/ui/widgets/tv_show_list/tv_show_list_widget.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  Widget makeLoader() {
    return Provider(
      create: (context) => LoaderViewModel(context),
      lazy: false,
      child: const LoaderWidget(),
    );
  }

  Widget makeAuth() {
    return ChangeNotifierProvider(
        child: const AuthWidget(), create: (_) => AuthViewModel());
  }

  Widget makeMainScreen() {
    return const MainScreenWidget();
  }

  Widget makeMovieDetails(int movieId) {
    return ChangeNotifierProvider(
      create: (_) => MovieDetailsModel(movieId),
      child: const MovieDetailsWidget(),
    );
  }

  Widget makeMovieTrailer(String youTubeKey) {
    return MovieTrailerWidget(
      youTubeKey: youTubeKey,
    );
  }

  Widget makeNewsList() {
    return const NewsWidget();
  }

  Widget makeMovieList() {
    return ChangeNotifierProvider(
      create: (_) => MovieListViewModel(),
      child: const MovieListWidget(),
    );
  }

  Widget makeTWShowList() {
    return const TVShowListWidget();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_2/ui/widgets/auth/auth_model.dart';
import 'package:flutter_application_2/ui/widgets/auth/auth_widget.dart';
import 'package:flutter_application_2/ui/widgets/loader/loader_view_model.dart';
import 'package:flutter_application_2/ui/widgets/loader/loader_widget.dart';
import 'package:flutter_application_2/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter_application_2/ui/widgets/movie_details/movie_details_model.dart';
import 'package:flutter_application_2/ui/widgets/movie_details/movie_details_widget.dart';
import 'package:flutter_application_2/ui/widgets/movie_list/movie_list_model.dart';
import 'package:flutter_application_2/ui/widgets/movie_list/movie_list_widget.dart';
import 'package:flutter_application_2/ui/widgets/movie_trailer/movie_trailer_widget.dart';
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

  Widget makeMovideDetails(int movieId) {
    return ChangeNotifierProvider(
      create: (_) => MovieDetailsModel(movieId),
      child: const MovieDetailsWidget(),
    );
  }

  Widget makeMovieTrailer(String youTubeKey) {
    return MovieTrailerWidget(youTubeKey: youTubeKey);
  }

  // Widget makeNewsList() {
  //   retrun const NewsWidget();
  // }

  Widget makeMovieList() {
    return ChangeNotifierProvider(
      create: (_) => MovieListViewModel(),
      child: const MovieListWidget(),
    );
  }

// Widget makeTVShowList() {
//   retrun const NewsWidget();
// }
}

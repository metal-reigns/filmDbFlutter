import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme/app_colors.dart';
import 'package:flutter_application_2/widgets/auth/auth_widget.dart';
import 'package:flutter_application_2/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter_application_2/widgets/movie_details/movie_details_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.mainDartBlue,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.mainDartBlue,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
          )),
      routes: {
        '/auth': (context) => AuthWidget(),
        '/main_screen': (context) => MainScreenWidget(),
        '/main_screen/movie_details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return MovieDetailsWidget(movieId: arguments);
          } else {
            return MovieDetailsWidget(movieId: 0);
          }
        },
      },
      initialRoute: '/auth',
      //   onGenerateRoute: (RouteSettings settings) {
      //     return MaterialPageRoute(builder: (context) {
      //       return Scaffold(
      //         body: Center(
      //           child: Text('404 Not Found'),
      //         ),
      //       );
      //     });
      //   },
    );
  }
}

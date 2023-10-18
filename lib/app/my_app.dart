import 'package:flutter/material.dart';
import 'package:flutter_application_2/ui/theme/app_colors.dart';
import 'package:flutter_application_2/ui/widgets/auth/auth_model.dart';
import 'package:flutter_application_2/ui/widgets/auth/auth_widget.dart';
import 'package:flutter_application_2/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter_application_2/ui/widgets/movie_details/movie_details_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainDarkBlue,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      routes: {
        '/auth': (context) => AuthProvider(
              model: AuthModel(),
              child: const AuthWidget(),
            ),
        '/main_screen': (context) => const MainScreenWidget(),
        '/main_screen/movie_details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return MovieDetailsWidget(movieId: arguments);
          } else {
            return const MovieDetailsWidget(movieId: 0);
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

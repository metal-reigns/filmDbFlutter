import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/my_app_model.dart';
import 'package:flutter_application_2/ui/navigation/main_navigation.dart';
import 'package:flutter_application_2/ui/theme/app_colors.dart';

class MyApp extends StatelessWidget {
  final MyAppModel model;
  static final mainNavigation = MainNavigation();
  const MyApp({Key? key, required this.model}) : super(key: key);

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
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute(model.isAuth),
      onGenerateRoute: mainNavigation.onGenerateRoute,
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

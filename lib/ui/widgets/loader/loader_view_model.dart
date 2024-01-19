import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/domain/services/auth_service.dart';
import 'package:flutter_application_2/ui/navigation/main_navigation.dart';

class LoaderViewModel {
  final BuildContext context;
  final _authService = AuthService();

  LoaderViewModel(this.context) {
    asyncInit();
  }

  Future<void> asyncInit() async {
    await checkAuth();
  }

  Future<void> checkAuth() async {
    final isAuth = await _authService.isAuth();
    final nextScreen = isAuth
        ? MainNavigationRouteNames.mainScreen
        : MainNavigationRouteNames.auth;
    Navigator.of(context).pushReplacementNamed(nextScreen);
  }
}

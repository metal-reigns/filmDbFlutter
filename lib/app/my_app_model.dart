import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/data_provider/session_data_provider.dart';
import 'package:flutter_application_2/ui/navigation/main_navigation.dart';

class MyAppModel {
  final _sessionDataProvider = SessionDataProvider();
  var _isAuth = false;
  bool get isAuth => _isAuth;

  Future<void> checkAuth() async {
    final sessionId = await _sessionDataProvider.getSessionId();
    _isAuth = sessionId != null;
  }

  Future<void> resetSession(BuildContext context) async {
    await _sessionDataProvider.setSessionId(null);
    await _sessionDataProvider.setAccountId(null);
    await Navigator.of(context).pushNamedAndRemoveUntil(
      MainNavigationRouteNames.auth,
      (route) => false,
    );
  }
}

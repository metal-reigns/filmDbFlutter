import 'package:flutter_app_movie_db/domain/api_client/account_api_client.dart';
import 'package:flutter_app_movie_db/domain/api_client/auth_api_client.dart';
import 'package:flutter_app_movie_db/domain/data_provider/session_data_provider.dart';

class AuthService {
  final _authApiClient = AuthApiClient();
  final _accountApiClient = AccountApiClient();
  final _sessionDataProvider = SessionDataProvider();

  Future<bool> isAuth() async {
    final String? sessionId = await _sessionDataProvider.getSessionId();
    final bool isAuth = sessionId != null;
    return isAuth;
  }

  Future<void> login(String login, String password) async {
    final String sessionId = await _authApiClient.auth(
      username: login,
      password: password,
    );
    final int accountId = await _accountApiClient.getAccountInfo(sessionId);
    await _sessionDataProvider.setAccountId(accountId);
    await _sessionDataProvider.setSessionId(sessionId);
  }

  Future<void> logout() async {
    await _sessionDataProvider.deleteSessionId();
    await _sessionDataProvider.deleteAccountId();
  }
}

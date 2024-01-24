enum ApiClientExceptionType { network, auth, other, sessionExpire }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;
  ApiClientException(this.type);
}

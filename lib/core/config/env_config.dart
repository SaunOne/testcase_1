class EnvConfig {
  const EnvConfig._();

  static const String env = String.fromEnvironment('ENV', defaultValue: 'dev');
  static const String baseUrl = String.fromEnvironment('BASE_URL');
  static const String baseUrlSocial = String.fromEnvironment('BASE_URL_SOCIAL');
  static const String socketUrlSocial = String.fromEnvironment(
    'SOCKET_URL_SOCIAL',
  );
  static const String apiKey = String.fromEnvironment('API_KEY');

  static bool get isDev => env == 'dev';
  static bool get isStaging => env == 'staging';
  static bool get isProd => env == 'prod';
}

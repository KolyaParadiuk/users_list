abstract class NetworkConfig {
  String get baseApiUrl;
}

class NetworkConfigImpl extends NetworkConfig {
  @override
  final String baseApiUrl = 'https://dummyjson.com';
}

class APINetwork {
  APINetwork({required this.path, String? baseUrl})
      : baseUrl = baseUrl ?? "https://api.escuelajs.co/api";

  String baseUrl;
  String version = "v1";
  String path;
  String get uri => "$baseUrl/$version/$path";

  final Map<String, String> headers = {'Content-Type': 'application/json'};
}

import 'dart:convert'; // For JSON decoding
import 'package:checkin/Api/EndPoint.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  // GET request
  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    try {
      final Uri url = Uri.parse('${EndPoint.baseUrl}/$endpoint');

      final response = await http.get(
        url,
        headers: {
          ...?headers,
          "Authorization": "Bearer ${EndPoint.token}",
          "Content-Type": "application/json"
        },
      ).timeout(Duration(seconds: EndPoint.timeoutDuration));

      return _handleResponse(response);
    } catch (e) {
      rethrow; // Propager l'erreur pour gestion ultérieure
    }
  }

  // POST request
  Future<dynamic> post(String endpoint,
      {Map<String, String>? headers, Object? body}) async {
    try {
      final Uri url = Uri.parse('${EndPoint.baseUrl}/$endpoint');
      final response = await http
          .post(url, headers: headers, body: body)
          .timeout(Duration(seconds: EndPoint.timeoutDuration));

      return _handleResponse(response);
    } catch (e) {
      rethrow; // Propagate the error for further handling
    }
  }

  // PUT request
  Future<dynamic> put(String endpoint,
      {Map<String, String>? headers, Object? body}) async {
    try {
      final Uri url = Uri.parse('${EndPoint.baseUrl}/$endpoint');
      final response = await http
          .put(url, headers: headers, body: body)
          .timeout(Duration(seconds: EndPoint.timeoutDuration));

      return _handleResponse(response);
    } catch (e) {
      rethrow; // Propagate the error for further handling
    }
  }

  // A helper function to handle the response
  dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      try {
        print(json.decode(response.body));
        return json.decode(response.body);
      } catch (e) {
        throw Exception('Failed to parse response: $e');
      }
    } else {
      // Handle other status codes (4xx, 5xx)
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }
}

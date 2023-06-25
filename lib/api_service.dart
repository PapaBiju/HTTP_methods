import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://your-api-url.com'; // Replace with your actual API URL

  // GET request
  static Future<http.Response> getData(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.get(url);
    return response;
  }

  // POST request
  static Future<http.Response> postData(String endpoint, dynamic data) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.post(url, body: data);
    return response;
  }

  // PUT request
  static Future<http.Response> putData(String endpoint, dynamic data) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.put(url, body: data);
    return response;
  }

  // DELETE request
  static Future<http.Response> deleteData(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.delete(url);
    return response;
  }
}

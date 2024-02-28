import 'package:dio/dio.dart';



class ApiService {
  final Dio _dio = Dio();

  static const String baseUrl = 'http://sherpur.rbfgroupbd.com/';

  // Your bearer token
  static const String bearerToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzA5MTQ0MDY1LCJleHAiOjE3MDkyMzA0NjV9.ibEnIgUSuuFCIDxkccCT6pdEo2UjVtmPOfrDEpiE8rw';

  ApiService() {
    _dio.options.headers['Authorization'] = 'Bearer $bearerToken';
  }

  Future<Response> get(String endpoint) async {
    try {
      final response = await _dio.get('$baseUrl$endpoint');
      return Response(requestOptions: response.requestOptions, data: response.data, statusCode: response.statusCode);
    } catch (error) {
      throw Exception('Failed to perform GET request: $error');
    }
  }

  Future<Response> post(String endpoint, dynamic data) async {
    try {
      final response = await _dio.post('$baseUrl$endpoint', data: data);
      return response;
    } catch (error) {
      throw Exception('Failed to perform POST request: $error');
    }
  }

  Future<Response> put(String endpoint, dynamic data) async {
    try {
      final response = await _dio.put('$baseUrl$endpoint', data: data);
      return response;
    } catch (error) {
      throw Exception('Failed to perform PUT request: $error');
    }
  }

  Future<Response> delete(String endpoint) async {
    try {
      final response = await _dio.delete('$baseUrl$endpoint');
      return response;
    } catch (error) {
      throw Exception('Failed to perform DELETE request: $error');
    }
  }
}

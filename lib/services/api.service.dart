import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.model.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:3000';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Product> products =
          body.map((dynamic item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}


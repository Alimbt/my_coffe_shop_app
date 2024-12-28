import 'dart:convert';
import 'package:http/http.dart' as http;

class CartApi {
  final String baseUrl = "http://your system ip/coffee_shop_api/cart_api";

  // دریافت همه محصولات
  Future<List<dynamic>> getAllCart() async {
    final response = await http.get(Uri.parse("$baseUrl/cart.php"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to fetch products");
    }
  }

  // افزودن یک محصول
  Future<bool> addCart(Map<String, String> productData) async {
    final response = await http.post(
      Uri.parse("$baseUrl/add_cart.php"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(productData),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Failed to add product");
    }
  }

  // حذف محصول
  Future<bool> deleteCart(String productName) async {
    final response = await http.post(
      Uri.parse("$baseUrl/delete_cart.php"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': productName}),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Failed to delete product");
    }
  }
}

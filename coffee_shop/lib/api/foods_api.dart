import 'dart:convert';
import 'package:http/http.dart' as http;

class FoodsApi {
  final String baseUrl = "http://your system ip/coffee_shop_api/food_api";

  // دریافت همه محصولات
  Future<List<dynamic>> getAllFoods() async {
    final response = await http.get(Uri.parse("$baseUrl/foods.php"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to fetch products");
    }
  }

  // افزودن یک محصول
  Future<bool> addFoods(Map<String, String> productData) async {
    final response = await http.post(
      Uri.parse("$baseUrl/add_food.php"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(productData),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Failed to add food");
    }
  }

  // حذف محصول
  Future<bool> deleteFoods(String productId) async {
    final response = await http.delete(
      Uri.parse("$baseUrl/delete_food.php"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'id': productId}),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Failed to delete food");
    }
  }
}

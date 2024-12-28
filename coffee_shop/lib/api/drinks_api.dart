import 'dart:convert';
import 'package:http/http.dart' as http;

class DrinksApi {
  final String baseUrl = "http://192.168.200.140/coffee_shop_api/drink_api";

  // دریافت همه محصولات
  Future<List<dynamic>> getAllDrinks() async {
    final response = await http.get(Uri.parse("$baseUrl/drinks.php"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to fetch drinks");
    }
  }

  // افزودن یک محصول
  Future<bool> addDrinks(Map<String, String> productData) async {
    final response = await http.post(
      Uri.parse("$baseUrl/add_drinks.php"),
      body: productData,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Failed to add drink");
    }
  }

  // حذف محصول
  Future<bool> deleteDrinks(String productId) async {
    final response = await http.post(
      Uri.parse("$baseUrl/delete_drinks.php"),
      body: {'id': productId},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Failed to delete drink");
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class FavoriteApi {
  final String baseUrl = "http://your system ip/coffee_shop_api/favorite_api";

  // دریافت همه علاقه‌مندی‌ها برای یک کاربر خاص
  Future<List<dynamic>> getAllFavorites(String userId) async {
    final response =
        await http.get(Uri.parse("$baseUrl/favorites.php?user_id=$userId"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to fetch favorites");
    }
  }

  // افزودن یک محصول به علاقه‌مندی‌ها
  Future<bool> addFavorite(Map<String, String> productData) async {
    final response = await http.post(
      Uri.parse("$baseUrl/add_favorites.php"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(productData),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Failed to add favorite");
    }
  }

  // حذف یک محصول از علاقه‌مندی‌ها
  Future<bool> deleteFavorite(String productId) async {
    final response = await http.delete(
      Uri.parse("$baseUrl/delete_favorites.php"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'product_id': productId}),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Failed to delete favorite");
    }
  }
}

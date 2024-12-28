class CartManager {
  static final List<String> CartCoffeeItems = [];

  static final List<String> CartFoodItems = [];

  static void addcartCoffee(String item) {
    CartCoffeeItems.add(item);
  }

  static void addCartFood(String item) {
    CartFoodItems.add(item);
  }

  static List<String> getAllCart() {
    return [...CartCoffeeItems, ...CartFoodItems];
  }
}

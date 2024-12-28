class FavoritesManager {
  static final List<String> favoriteCoffeeItems = [];
  static final List<String> favoriteFoodItems = [];

  static void addFavoriteCoffee(String item) {
    if (!favoriteCoffeeItems.contains(item)) {
      favoriteCoffeeItems.add(item);
    }
  }

  static void addFavoriteFood(String item) {
    if (!favoriteFoodItems.contains(item)) {
      favoriteFoodItems.add(item);
    }
  }

  static List<String> getAllFavorites() {
    return [...favoriteCoffeeItems, ...favoriteFoodItems];
  }
}

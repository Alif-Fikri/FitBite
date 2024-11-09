class MenuItem {
  final String name;
  final int price;
  final String imageUrl;

  MenuItem(this.name, this.price, this.imageUrl);
}

// Separate classes for each menu category
class HotSaleMenu {
  static List<MenuItem> getFilteredItems(String searchText) {
    List<MenuItem> items = [
      MenuItem('Chicken Salad', 45, 'assets/food1.png'),
      MenuItem('Rice With Meat', 55, 'assets/food2.png'),
      MenuItem('Rice With Meat', 45, 'assets/food3.png'),
      MenuItem('Rice With Meat', 45, 'assets/food4.png'),
      MenuItem('Rice With Meat', 45, 'assets/food5.png'),
      MenuItem('Rice With Meat', 45, 'assets/food6.png'),
      MenuItem('Rice With Meat', 45, 'assets/food7.png'),
      MenuItem('Rice With Meat', 45, 'assets/food8.png'),
      // Add more items
    ];
    return items
        .where((item) =>
            item.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }
}

class PopularMenu {
  static List<MenuItem> getFilteredItems(String searchText) {
    List<MenuItem> items = [
      MenuItem('Rice with Meat', 55, 'assets/food1.png'),
      // Add more items
    ];
    return items
        .where((item) =>
            item.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }
}

class NewMenu {
  static List<MenuItem> getFilteredItems(String searchText) {
    List<MenuItem> items = [
      MenuItem('Vegetable Stir-fry', 30, 'assets/food1.png'),
      // Add more items
    ];
    return items
        .where((item) =>
            item.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }
}

class AllMenu {
  static List<MenuItem> getFilteredItems(String searchText) {
    List<MenuItem> items = [
      MenuItem('Pasta', 40, 'assets/food1.png'),
      // Add all items from different categories
    ];
    return items
        .where((item) =>
            item.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }
}

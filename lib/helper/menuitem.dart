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
      MenuItem('Chicken Salad', 45, 'https://via.placeholder.com/150'),
      MenuItem('Rice With Meat', 45, 'https://via.placeholder.com/150'),
      MenuItem('Rice With Meat', 45, 'https://via.placeholder.com/150'),
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
      MenuItem('Rice with Meat', 55, 'https://via.placeholder.com/150'),
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
      MenuItem('Vegetable Stir-fry', 30, 'https://via.placeholder.com/150'),
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
      MenuItem('Pasta', 40, 'https://via.placeholder.com/150'),
      // Add all items from different categories
    ];
    return items
        .where((item) =>
            item.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }
}

class MenuItem {
  final String name;
  final int price;
  final String imageUrl;
  final String calories; // Tambahkan kalori sebagai String

  MenuItem(this.name, this.price, this.imageUrl, this.calories);
}
class HotSaleMenu {
  static List<MenuItem> getFilteredItems(String searchText) {
    List<MenuItem> items = [
      MenuItem('Chicken Salad', 45, 'assets/food1.png', '150'),
      MenuItem('Rice With Meat', 55, 'assets/food2.png', '300'),
      MenuItem('Rice With Meats', 45, 'assets/food3.png', '320'),
      MenuItem('Rice With Meatq', 45, 'assets/food4.png', '310'),
      MenuItem('Rice With Meatw', 45, 'assets/food5.png', '330'),
      MenuItem('Rice With Meate', 45, 'assets/food6.png', '280'),
      MenuItem('Rice With Meatr', 45, 'assets/food7.png', '250'),
      MenuItem('Rice With Meatt', 45, 'assets/food8.png', '270'),
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
      MenuItem('Rice with Meat', 55, 'assets/food1.png', '300'),
      // Tambahkan data lainnya
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
      MenuItem('Vegetable Stir-fry', 30, 'assets/food1.png', '200'),
      // Tambahkan data lainnya
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
      MenuItem('Pasta', 40, 'assets/food1.png', '250'),
      MenuItem('Chicken Salad', 45, 'assets/food1.png', '150'),
      MenuItem('Rice with Meat', 55, 'assets/food1.png', '300'),
      MenuItem('Vegetable Stir-fry', 30, 'assets/food1.png', '200'),
      // Tambahkan semua item dari kategori lain
    ];
    return items
        .where((item) =>
            item.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }
}


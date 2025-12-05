class Product {
  final String name;
  final String imageUrl;
  final int originalprice;

  Product(this.name, this.imageUrl, this.originalprice);

  static List<Product> menProducts = [
    Product('T-Shirt', 'assets/cover_images/cover_men.jpeg', 1499),
    Product('Shirt', 'assets/cover_images/cover_women.jpeg', 1999),
    Product('Denim Jeans', 'assets/cover_images/cover_kidss.jpeg', 2499),
  ];

  static List<Product> womenProducts = [
    Product('Floral Dress', 'assets/women/floral_dress.png', 2999),
    Product('Handbag', 'assets/women/handbag.png', 3499),
    Product('Heels', 'assets/women/heels.png', 2799),
  ];

  static List<Product> childrenProducts = [
    Product('Cartoon T-Shirt', 'assets/kids/cartoon_tshirt.png', 1299),
    Product('Mini Sneakers', 'assets/kids/mini_sneakers.png', 1899),
    Product('Colorful Hoodie', 'assets/kids/colorful_hoodie.png', 1599),
  ];
}

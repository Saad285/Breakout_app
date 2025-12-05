import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_pt1/Products.dart';
import 'package:provider_pt1/cardbuilder.dart';

class ShopPage extends StatefulWidget {
  final int? indicator;
  const ShopPage({super.key, required this.indicator});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<Product>? products;

  List<Product> cartItems = [];

  @override
  void initState() {
    super.initState();
    selectProduct();
  }

  void selectProduct() {
    switch (widget.indicator) {
      case 1:
        products = Product.menProducts;
        break;
      case 2:
        products = Product.womenProducts;
        break;
      case 3:
        products = Product.childrenProducts;
        break;
      default:
        products = [];
    }
  }

  void addToCart(Product product) {
    setState(() {
      cartItems.add(product);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "${product.name} added to cart",
          style: GoogleFonts.montserrat(),
        ),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.55,
        ),
        itemCount: products?.length ?? 0,
        itemBuilder: (context, index) {
          final product = products![index];
          return Cardbuilder(
            imageUrl: product.imageUrl,
            title: product.name,
            originalPrice: product.originalprice,
          );
        },
      ),
    );
  }
}

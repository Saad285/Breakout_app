import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_pt1/cartitem.dart';

class Cardbuilder extends StatefulWidget {
  final String imageUrl;
  final String title;
  final int originalPrice;
  const Cardbuilder({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.originalPrice,
  });

  @override
  State<Cardbuilder> createState() => _CardbuilderState();
}

class _CardbuilderState extends State<Cardbuilder> {
  void addtoCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.title} added to cart!'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 11,
              child: Image.asset(
                widget.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "PKR ${widget.originalPrice}",
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isClicked = !isClicked;
                                if (isClicked) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '${widget.title} added to cart!',
                                      ),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                  CartItem.items.add(
                                    CartItem(
                                      name: widget.title,
                                      imageUrl: widget.imageUrl,
                                      price: widget.originalPrice,
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '${widget.title} removed from cart!',
                                      ),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                  CartItem.items.removeWhere(
                                    (item) =>
                                        item.name == widget.title &&
                                        item.imageUrl == widget.imageUrl &&
                                        item.price == widget.originalPrice,
                                  );
                                }
                              });
                            },
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 300),
                              child: Icon(
                                isClicked
                                    ? Icons.shopping_bag
                                    : Icons.shopping_bag_outlined,
                                key: ValueKey(isClicked),
                                color: isClicked ? Colors.black : Colors.grey,
                                size: isClicked ? 28 : 28,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.title.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

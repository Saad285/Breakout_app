import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  void _navigateToCategory(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CategoryPage(category: category)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Search',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.0,
                children: [
                  _CategoryCard(
                    label: 'Shoes',
                    icon: Icons.directions_run,
                    onTap: () => _navigateToCategory(context, 'Shoes'),
                  ),
                  _CategoryCard(
                    label: 'Clothes',
                    icon: Icons.checkroom,
                    onTap: () => _navigateToCategory(context, 'Clothes'),
                  ),
                  _CategoryCard(
                    label: 'New drops',
                    icon: Icons.fiber_new,
                    onTap: () => _navigateToCategory(context, 'New drops'),
                  ),
                  _CategoryCard(
                    label: 'Bags',
                    icon: Icons.shopping_bag_outlined,
                    onTap: () => _navigateToCategory(context, 'Bags'),
                  ),
                  _CategoryCard(
                    label: 'Accessories',
                    icon: Icons.watch_outlined,
                    onTap: () => _navigateToCategory(context, 'Accessories'),
                  ),
                  _CategoryCard(
                    label: 'SALE %',
                    icon: Icons.local_offer,
                    isHighlight: true,
                    onTap: () => _navigateToCategory(context, 'SALE %'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isHighlight;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.label,
    required this.icon,
    this.isHighlight = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: isHighlight ? const Color(0xFFE5FF00) : Colors.grey[100],
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.black87),
            const SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final String category;
  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'Showing products for "$category"',
          style: GoogleFonts.montserrat(fontSize: 18, color: Colors.black87),
        ),
      ),
    );
  }
}

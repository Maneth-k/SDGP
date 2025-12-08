import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../product/product_card.dart';
import '../data/dummy_products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("Lumeo", style: TextStyle(fontSize: 20)),
        actions: [
          Icon(Icons.person_outline),
          SizedBox(width: 16),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/banner.jpg",
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.white54),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Search products",
                        hintStyle: TextStyle(color: Colors.white38),
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 25),
            Text("Sale",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyProducts.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: dummyProducts[index]);
                },
              ),
            ),
            SizedBox(height: 25),
            Text("New Arrivals",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyProducts.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: dummyProducts[index]);
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: "Wishlist"),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined), label: "AR"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "More"),
        ],
      ),
    );
  }
}

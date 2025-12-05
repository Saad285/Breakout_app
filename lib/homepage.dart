import 'package:flutter/material.dart';
import 'package:provider_pt1/coverpage.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset('assets/logo/logo.png', height: 90),
          bottom: const TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),

            tabs: [
              Tab(text: 'MEN'),
              Tab(text: 'KIDS'),
              Tab(text: 'WOMEN'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CoverPage(
              imagee: 'assets/cover_images/cover_men.jpeg',
              color: Colors.white,
              indicator: 1,
            ),
            CoverPage(
              imagee: 'assets/cover_images/cover_kidss.jpeg',
              color: Colors.white,
              indicator: 2,
            ),
            CoverPage(
              imagee: 'assets/cover_images/cover_women.jpeg',
              color: const Color.fromARGB(255, 231, 9, 9),
              indicator: 3,
            ),
          ],
        ),
      ),
    );
  }
}

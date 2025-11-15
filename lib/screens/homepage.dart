import 'package:flutter/material.dart';
import 'package:ballin_mobile/widgets/home_buttons.dart';
import 'package:ballin_mobile/widgets/drawer.dart';

class MyHomePage extends StatelessWidget {
  final String? username;

  MyHomePage({super.key, this.username});

  final List<ItemHomepage> items = [
    ItemHomepage("All Products", Icons.storefront_rounded, Colors.blue),
    ItemHomepage("My Products", Icons.person_rounded, Colors.green),
    ItemHomepage("Create Product", Icons.add_rounded, Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ballin",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.black,
      ),
      drawer: LeftDrawer(username: username),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16.0),
                  Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/welcome-bg.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Welcome to Ballin!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 16.0)),
                        GridView.count(
                          primary: true,
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          children: items.map((ItemHomepage item) {
                            return HomeButton(item, username);
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Theme.of(context).colorScheme.primary,
            child: const Center(
              child: Text(
                "Created by Nathanael Leander Herdanatra - 2406421320 as a project of class PBP A",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

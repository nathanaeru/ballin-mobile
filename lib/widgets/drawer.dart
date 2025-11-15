import 'package:flutter/material.dart';
import 'package:ballin_mobile/screens/homepage.dart';
import 'package:ballin_mobile/screens/add_product.dart';
import 'package:ballin_mobile/screens/all_product_list.dart';
import 'package:ballin_mobile/screens/my_product_list.dart';
import 'package:ballin_mobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class LeftDrawer extends StatelessWidget {
  final String? username;

  const LeftDrawer({super.key, this.username});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/welcome-bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Ballin",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Text(
                        "All Your Football Needs",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home_rounded),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(username: username),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.storefront_rounded),
                  title: const Text('All Products'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductListPage(username: username),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person_rounded),
                  title: const Text('My Products'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MyProductListPage(username: username),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.add_rounded),
                  title: const Text('Add Product'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductForm(username: username),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Footer showing the currently logged-in username.
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
            color: Theme.of(context).colorScheme.primary,
            child: Row(
              children: [
                Text(
                  username ?? 'Guest',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    final response = await request.logout(
                      "https://nathanael-leander-ballin.pbp.cs.ui.ac.id/auth/logout/",
                    );
                    String message = response["message"];
                    if (context.mounted) {
                      if (response['status']) {
                        String uname = response["username"];
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary.withAlpha(200),
                            content: Text("$message See you again, $uname."),
                          ),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(message)));
                      }
                    }
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

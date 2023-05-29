import 'package:flutter/material.dart';
import 'package:tes_2/core.dart';
import 'package:tes_2/pages/about/about.dart';

import '../../module/datamaster/view/datamaster_view.dart';
import '../../module/simlab/view/simlab_view.dart';
import '../../shared/widget/bottom_nav_bar/bottom_nav_bar.dart';
import '../../state_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [const SimlabView(), DatamasterView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6fbe3),
      bottomNavigationBar: BottomNavbar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
            builder: (context) => IconButton(
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                )),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xffb4c8b1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //logo
                DrawerHeader(
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    color: Colors.grey[800],
                  ),
                ),

                const SizedBox(
                  height: 20.0,
                ),

                // other pages
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () {
                        Get.to(HomePage());
                      },
                      icon: const Icon(
                        Icons.home,
                        size: 24.0,
                      ),
                    ),
                    title: Text(
                      'Home',
                      style: const TextStyle(
                        color: Color(0xff5c5c5c),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () {
                        Get.to(About());
                      },
                      icon: const Icon(
                        Icons.info,
                        size: 24.0,
                      ),
                    ),
                    title: Text(
                      'About',
                      style: const TextStyle(
                        color: Color(0xff5c5c5c),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 300.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () {
                        Get.to(LoginView());
                      },
                      icon: const Icon(
                        Icons.logout,
                        size: 24.0,
                      ),
                    ),
                    title: Text(
                      'Logout',
                      style: const TextStyle(
                        color: Color(0xff5c5c5c),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

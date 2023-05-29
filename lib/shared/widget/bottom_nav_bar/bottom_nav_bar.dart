import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavbar extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavbar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13.0),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Color(0xff5c5c5c),
        color: Color(0xff5c5c5c),
        tabActiveBorder: Border.all(color: Color(0xff2a9235)),
        tabBorderRadius: 20,
        gap: 8,
        tabs: [
          // beranda
          GButton(
            icon: Icons.home_filled,
            // Warna ketika dihover
            hoverColor: Color(0xff2a9235),
            text: 'Simlab',

            textStyle: TextStyle(
                color: Color(0xff5c5c5c)), // Ganti warna teks ketika dihover
            onPressed: () {
              // Fungsi yang dipanggil saat tombol ditekan
            },
            // Menggunakan HoverExample sebagai child widget
          ),

          // Data Master
          GButton(
            icon: Icons.construction,
            // Warna ketika dihover
            hoverColor: Color(0xff2a9235),
            text: 'DataMaster',

            textStyle: TextStyle(
                color: Color(0xff5c5c5c)), // Ganti warna teks ketika dihover
            onPressed: () {
              // Fungsi yang dipanggil saat tombol ditekan
            },
          ),
        ],
      ),
    );
  }
}

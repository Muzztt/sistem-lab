// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:tes_2/pages/home_page/home_page.dart';
import 'package:tes_2/shared/widget/drawer/drawer.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6fbe3),
      appBar: AppBar(
        backgroundColor: Color(0xff2a9235),
        title: const Text("About"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 180.0,
                  height: 180.0,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Simlab",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5c5c5c),
                  ),
                ),
                Text(
                  "Sistem Manajamen Lab",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xff5c5c5c),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "       Pinjaman barang dan ruangan dalam laboratorium komputer adalah praktik di mana seseorang atau sekelompok orang meminjamkan peralatan atau ruang di laboratorium komputer kepada orang lain untuk keperluan tertentu. Ini adalah bentuk kolaborasi yang memungkinkan akses yang lebih luas ke fasilitas komputer dan perangkat keras yang mungkin tidak tersedia secara pribadi atau terbatas. ",
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      "       Keberadaan laboratorium komputer yang lengkap dengan perangkat keras dan perangkat lunak yang mutakhir sangat penting dalam dunia teknologi informasi. Namun, tidak semua individu atau kelompok memiliki akses langsung ke fasilitas semacam itu. Pinjaman barang dan ruangan dalam laboratorium komputer memberikan kesempatan kepada mereka yang membutuhkan untuk memanfaatkan sumber daya tersebut.",
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "Manfaat Utama :",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "       Akses ke Peralatan yang Mahal: Laboratorium komputer seringkali dilengkapi dengan peralatan canggih dan mahal, seperti server, pemrograman jaringan, dan perangkat keras khusus lainnya. Dengan meminjam barang dari laboratorium komputer, individu atau kelompok dapat mengakses peralatan ini tanpa harus membelinya sendiri, yang dapat menghemat biaya yang signifikan.",
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      "       Peningkatan Keterampilan dan Pengetahuan: Dengan menggunakan fasilitas laboratorium komputer, individu atau kelompok dapat belajar dan mengembangkan keterampilan baru dalam penggunaan perangkat keras dan perangkat lunak yang lebih canggih. Ini dapat membantu mereka meningkatkan pemahaman mereka tentang teknologi informasi dan mempersiapkan diri untuk tantangan yang lebih tinggi di bidang IT.",
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      "       Kolaborasi dan Inovasi: Pinjaman barang dan ruangan dalam laboratorium komputer mendorong kolaborasi dan pertukaran ide antara individu atau kelompok yang berbeda. Dalam lingkungan yang saling mendukung ini, inovasi dapat berkembang lebih baik, dan pemecahan masalah dapat ditemukan melalui perspektif yang beragam.",
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      "       Penghematan Ruang: Dalam beberapa kasus, laboratorium komputer mungkin memiliki ruang yang tidak digunakan secara optimal. Dengan meminjam ruang tersebut, fasilitas laboratorium dapat dimanfaatkan sepenuhnya, menghindari pemborosan ruang dan memberikan kesempatan kepada orang lain untuk menggunakan fasilitas tersebut.",
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      "       Namun, saat meminjam barang atau ruang dalam laboratorium komputer, penting untuk mengikuti aturan dan prosedur yang ditetapkan oleh penyedia laboratorium. Ini termasuk merawat dan menggunakan peralatan dengan baik, mengikuti jadwal peminjaman yang ditentukan, dan mengembalikan barang atau ruangan dalam kondisi yang sama seperti saat dipinjam.",
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

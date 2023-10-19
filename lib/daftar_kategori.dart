import 'package:flutter/material.dart';
import 'package:pencarian_kos/detail_screen.dart';

class DaftarKategori extends StatelessWidget {
  const DaftarKategori({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 235, 232, 255),
        body: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 56),
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 187, 180, 221),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(36))),
                    child: Row(
                      children: [
                        Text(
                          'Hi Kost Hunter!',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 85,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          bottom: 10, right: 20, left: 20, top: 180),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 20,
                                color: Color.fromARGB(255, 241, 230, 230))
                          ]),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: TextStyle(
                                color:
                                    const Color.fromARGB(255, 211, 210, 210)),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            icon: Icon(Icons.search)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0),
                    itemCount: tourismPlaceList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                    place: tourismPlaceList[index]),
                              ),
                            );
                          },
                          child: Card(
                              shadowColor: Color.fromARGB(255, 186, 175, 255),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 8,
                              child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15), // Adjust the border radius as needed
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 56,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              tourismPlaceList[index]
                                                  .imageAsset,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(
                                            8.0), // Adjust the padding as needed
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              tourismPlaceList[index].name,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    12, // Adjust the font size as needed
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              tourismPlaceList[index]
                                                  .description,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 8,
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              tourismPlaceList[index].harga,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      );
                    }))
          ],
        ));
  }
}

class TourismPlace {
  String name;
  String description;
  String imageAsset;
  String info;
  String harga;

  TourismPlace({
    required this.name,
    required this.description,
    required this.imageAsset,
    required this.info,
    required this.harga,
  });
}

var tourismPlaceList = [
  TourismPlace(
    name: 'Kos Dewisri',
    description: 'wifi, kasur, akses 24 jam',
    imageAsset: 'assets/imagekos/dewisri.jpg',
    info:
        'Kost ini terdiri dari 3 lantai. Tipe kamar C berada di lantai 1 dan lantai 2 dengan beberapa kamar memiliki jendela menghadap ke arah koridor dan beberapa kamar memiliki jendela menghadap ke arah luar. Terdapat layanan pembersihan AC secara rutin setiap 3 bulan sekali. Kost ini berlokasi 1 menit dari jalan raya dengan akses yang dapat dilalui oleh mobil, berlokasi 8 menit dari Universitas Brawijaya, 9 menit dari Universitas Negeri Malang, 10 menit dari Universitas Muhammadiyah Malang, dan 9 menit dari Malang Town Square.',
    harga: 'Rp. 550.000',
  ),
  TourismPlace(
      name: 'Kos Putri Rahma',
      description: 'wifi, kasur, KM Luar',
      imageAsset: 'assets/imagekos/putrirahma.jpg',
      info:
          'Kost ini terdiri dari 3 lantai. Tipe kamar A berada di lantai 1 dengan jendela menghadap ke arah koridor. Terdapat layanan pembersihan AC secara rutin setiap 3 bulan sekali. Apabila Anda membutuhkan bantuan, Anda dapat menghubungi penjaga yang bertugas dari pukul 08.00-21.00 WIB. Kost ini berlokasi 1 menit dari jalan raya dengan akses yang dapat dilalui oleh mobil, berlokasi 8 menit dari Universitas Brawijaya, 9 menit dari Universitas Negeri Malang, 10 menit dari Universitas Muhammadiyah Malang, dan 9 menit dari Malang Town Square.',
      harga: 'Rp. 500.000'),
  TourismPlace(
    name: 'kos golden',
    description: 'KM Dalam, wifi, AC ',
    imageAsset: 'assets/imagekos/golden.jpg',
    info:
        'Kost Premium khusus PUTRA, NO Pasutri and BUKAN kost LV or Los Ambles ya gaes. feel the Amazing fasilities such as water heater, TV, wifi, Private Terace in each Room, Suwejuk Semriwing dengan sirkulasi udara baik dan sehat, serasa stay di apartemen Dubay gaes.6 month advance payment. No Bulanan ya Sultan lets begin your journey and study staying with Usa place for the sultans',
    harga: 'Rp. 700.000',
  ),
  TourismPlace(
    name: 'Kos Candi Badut',
    description: 'KM Luar, wifi, kasur',
    imageAsset: 'assets/imagekos/candi.jpg',
    info:
        'Kost ini terdiri dari 3 lantai. Tipe kamar A berada di lantai 1 dengan jendela menghadap ke arah koridor. Terdapat layanan pembersihan AC secara rutin setiap 3 bulan sekali. Apabila Anda membutuhkan bantuan, Anda dapat menghubungi penjaga yang bertugas dari pukul 08.00-21.00 WIB. Kost ini berlokasi 1 menit dari jalan raya dengan akses yang dapat dilalui oleh mobil, berlokasi 8 menit dari Universitas Brawijaya, 9 menit dari Universitas Negeri Malang, 10 menit dari Universitas Muhammadiyah Malang, dan 9 menit dari Malang Town Square.',
    harga: 'Rp. 600.000',
  ),
  TourismPlace(
      name: 'Kos Ar-Raudlah',
      description: 'KM Luar, Wifi, kasur',
      imageAsset: 'assets/imagekos/arraudlah.jpg',
      info:
          'Kost ini terdiri dari 3 lantai. Tipe kamar A berada di lantai 1 dengan jendela menghadap ke arah koridor. Terdapat layanan pembersihan AC secara rutin setiap 3 bulan sekali. Apabila Anda membutuhkan bantuan, Anda dapat menghubungi penjaga yang bertugas dari pukul 08.00-21.00 WIB. Kost ini berlokasi 1 menit dari jalan raya dengan akses yang dapat dilalui oleh mobil, berlokasi 8 menit dari Universitas Brawijaya, 9 menit dari Universitas Negeri Malang, 10 menit dari Universitas Muhammadiyah Malang, dan 9 menit dari Malang Town Square.',
      harga: 'Rp. 650.000'),
  TourismPlace(
      name: 'Kos Apik',
      description: 'KM Dalam, Almari, Kasur',
      imageAsset: 'assets/imagekos/apik.jpg',
      info:
          'Kost ini terdiri dari 3 lantai. Tipe kamar A berada di lantai 1 dengan jendela menghadap ke arah koridor. Terdapat layanan pembersihan AC secara rutin setiap 3 bulan sekali. Apabila Anda membutuhkan bantuan, Anda dapat menghubungi penjaga yang bertugas dari pukul 08.00-21.00 WIB. Kost ini berlokasi 1 menit dari jalan raya dengan akses yang dapat dilalui oleh mobil, berlokasi 8 menit dari Universitas Brawijaya, 9 menit dari Universitas Negeri Malang, 10 menit dari Universitas Muhammadiyah Malang, dan 9 menit dari Malang Town Square.',
      harga: 'Rp. 690.000'),
  TourismPlace(
      name: 'Kos Griya Pinang',
      description: 'KM Dalam, Almari, Kasur',
      imageAsset: 'assets/imagekos/griyapinang.jpg',
      info:
          'Kost ini terdiri dari 3 lantai. Tipe kamar A berada di lantai 1 dengan jendela menghadap ke arah koridor. Terdapat layanan pembersihan AC secara rutin setiap 3 bulan sekali. Apabila Anda membutuhkan bantuan, Anda dapat menghubungi penjaga yang bertugas dari pukul 08.00-21.00 WIB. Kost ini berlokasi 1 menit dari jalan raya dengan akses yang dapat dilalui oleh mobil, berlokasi 8 menit dari Universitas Brawijaya, 9 menit dari Universitas Negeri Malang, 10 menit dari Universitas Muhammadiyah Malang, dan 9 menit dari Malang Town Square.',
      harga: 'Rp. 750.000'),
  TourismPlace(
      name: 'Kos Kamboja',
      description: 'KM Dalam, Almari, Kasur',
      imageAsset: 'assets/imagekos/kamboja.jpg',
      info:
          'Kost ini terdiri dari 3 lantai. Tipe kamar A berada di lantai 1 dengan jendela menghadap ke arah koridor. Terdapat layanan pembersihan AC secara rutin setiap 3 bulan sekali. Apabila Anda membutuhkan bantuan, Anda dapat menghubungi penjaga yang bertugas dari pukul 08.00-21.00 WIB. Kost ini berlokasi 1 menit dari jalan raya dengan akses yang dapat dilalui oleh mobil, berlokasi 8 menit dari Universitas Brawijaya, 9 menit dari Universitas Negeri Malang, 10 menit dari Universitas Muhammadiyah Malang, dan 9 menit dari Malang Town Square.',
      harga: 'Rp. 1.000.000'),
  TourismPlace(
      name: 'Kos Muji Rahayu',
      description: 'KM Dalam, Almari, Kasur',
      imageAsset: 'assets/imagekos/mujirahayu.jpg',
      info:
          'Kost ini terdiri dari 3 lantai. Tipe kamar A berada di lantai 1 dengan jendela menghadap ke arah koridor. Terdapat layanan pembersihan AC secara rutin setiap 3 bulan sekali. Apabila Anda membutuhkan bantuan, Anda dapat menghubungi penjaga yang bertugas dari pukul 08.00-21.00 WIB. Kost ini berlokasi 1 menit dari jalan raya dengan akses yang dapat dilalui oleh mobil, berlokasi 8 menit dari Universitas Brawijaya, 9 menit dari Universitas Negeri Malang, 10 menit dari Universitas Muhammadiyah Malang, dan 9 menit dari Malang Town Square.',
      harga: 'Rp. 750.000'),
  TourismPlace(
      name: 'Kos Sakura',
      description: 'KM Dalam, Almari, Kasur',
      imageAsset: 'assets/imagekos/sakura.jpg',
      info:
          'Kost ini terdiri dari 3 lantai. Tipe kamar A berada di lantai 1 dengan jendela menghadap ke arah koridor. Terdapat layanan pembersihan AC secara rutin setiap 3 bulan sekali. Apabila Anda membutuhkan bantuan, Anda dapat menghubungi penjaga yang bertugas dari pukul 08.00-21.00 WIB. Kost ini berlokasi 1 menit dari jalan raya dengan akses yang dapat dilalui oleh mobil, berlokasi 8 menit dari Universitas Brawijaya, 9 menit dari Universitas Negeri Malang, 10 menit dari Universitas Muhammadiyah Malang, dan 9 menit dari Malang Town Square.',
      harga: 'Rp. 800.000'),
];

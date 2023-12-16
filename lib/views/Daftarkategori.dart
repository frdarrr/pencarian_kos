import 'package:flutter/material.dart';
import 'package:pencarian_kos/login.dart';
import 'package:pencarian_kos/profile.dart';
import 'package:pencarian_kos/sidebar.dart';
import 'package:pencarian_kos/views/detail_screen.dart';
import 'package:pencarian_kos/viewmodels/fetch_data_kos.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DaftarKategori extends StatefulWidget {
  const DaftarKategori({Key? key}) : super(key: key);

  @override
  State<DaftarKategori> createState() => _DaftarKategoriState();
}

class _DaftarKategoriState extends State<DaftarKategori> {
  Repository repo = Repository();
  FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController searchController = TextEditingController();
  List<dynamic> dataList = [];
  List<dynamic> filteredData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<dynamic> data = await repo.fetchDataPlaces();
    setState(() {
      dataList = data;
      filteredData = dataList;
    });
  }

  void goToProfilePage() {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => profilepage()));
  }

  void filterData(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredData = dataList;
      } else {
        filteredData = dataList
            .where((item) =>
                item.nama.toLowerCase().contains(query.toLowerCase()) ||
                item.deksripsi.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sidebar(
        onProfileTap: goToProfilePage,
        onSignOut: () {
          _auth.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
        },
      ),
      backgroundColor: Color.fromARGB(255, 235, 232, 255),
      body: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 56),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 187, 180, 221),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Hi Kost Hunter!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
                    margin: EdgeInsets.only(bottom: 10, right: 20, left: 20, top: 180),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 20,
                          color: Color.fromARGB(255, 241, 230, 230),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: searchController,
                      onChanged: (query) {
                        filterData(query);
                      },
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 211, 210, 210),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: filteredData.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(place: filteredData[index]),
                        ),
                      );
                    },
                    child: Card(
                      shadowColor: Color.fromARGB(255, 186, 175, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 8,
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    image: NetworkImage(filteredData[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      filteredData[index].nama,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      filteredData[index].deksripsi,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 8,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      filteredData[index].harga,
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
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

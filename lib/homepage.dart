import 'package:flutter/material.dart';
import 'package:pencarian_kos/daftar_kategori.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 232, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Padding(
                padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 30,
            )),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 70,
              left: 20,
            ),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text('WELCOME',
                    style: TextStyle(
                        color: Colors.black26,
                        fontSize: 30,
                        fontWeight: FontWeight.bold))),
          ),
          Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Kost Hunter',
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 20,
                    ),
                  ))),
          Container(
            margin: EdgeInsets.only(top: 10, right: 20),
            width: 300,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                  'Providing a comfortable and efficient experience in finding a suitable place to stay',
                  style: TextStyle(
                    color: Colors.black26,
                    height: 1.5,
                  )),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 5, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DaftarKategori()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 187, 180, 221),
                          borderRadius: BorderRadius.circular(20)),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text('GET START',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              )),
          Container(
            child: Spacer(),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/icon/logoimage.png'),
          )
        ],
      ),
    );
  }
}

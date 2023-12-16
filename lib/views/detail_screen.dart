import 'package:flutter/material.dart';
import 'package:pencarian_kos/models/datakos.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatelessWidget {
  final Datakos place;
  const DetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 187, 180, 221),
        body: Stack(children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  place.image,
                ),
              )),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 332,
            bottom: 0,
            child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    color: Colors.white),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.place_outlined,
                        size: 20,
                        color: Color.fromARGB(218, 214, 213, 213),
                      ),
                      Text(
                        'Malang, Jawa Timur',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(218, 214, 213, 213),
                        ),
                      ),
                      SizedBox(width: 50),
                      Container(
                        alignment: Alignment.topRight,
                        decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(20)),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          "Booking",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.nama,
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Color.fromARGB(218, 187, 186, 186),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star_half,
                              size: 20,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ReadMoreText(
                        place.detail,
                        trimLines: 6,
                        style: TextStyle(color: Colors.black),
                        colorClickableText: Color.fromARGB(255, 125, 75, 57),
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: ' Show less',
                        moreStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      // Container(
                      //   child: Spacer(),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ))
                ])),
          )
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:pencarian_kos/homepage.dart';
import 'package:pencarian_kos/models/listile.dart';
import 'package:pencarian_kos/views/Daftarkategori.dart';

class sidebar extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onKategori;
  final void Function()? onSignOut;
  const sidebar(
      {super.key, this.onProfileTap, this.onKategori, this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 190, 181, 248),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DrawerHeader(
                  child: Icon(
                Icons.person,
                color: Colors.black,
                size: 64,
              )),
              // listtile(
              //     icon: Icons.home,
              //     text: 'H O M E',
              //     onTap: () => Navigator.pop(context)),
              listtile(
                  icon: Icons.person, text: 'P R O F I L', onTap: onProfileTap),
              listtile(
                icon: Icons.list,
                text: 'K A T E G O R I',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DaftarKategori()));
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: listtile(
              icon: Icons.logout,
              text: 'L O G O U T',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homepage()));
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fuego/banner_detailpage.dart';

class Banners extends StatefulWidget {
  const Banners({super.key});

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  final userNameContrroller = TextEditingController();
  final fullNameContrroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banners'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: userNameContrroller,
              decoration: const InputDecoration(
                labelText: 'Enter Username',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: fullNameContrroller,
              decoration: const InputDecoration(
                labelText: 'Enter FullName',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BannerDetailpage(
                            userName: userNameContrroller.text,
                            fullName: fullNameContrroller.text,
                          )));
            },
            child: const Text('Edit Profile'),
          ),
        ],
      ),
    );
  }
}

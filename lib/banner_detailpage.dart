import 'package:flutter/material.dart';

class BannerDetailpage extends StatefulWidget {
  final String userName;
  final String fullName;
  const BannerDetailpage(
      {super.key, required this.userName, required this.fullName});

  @override
  State<BannerDetailpage> createState() => _BannerDetailpageState();
}

class _BannerDetailpageState extends State<BannerDetailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner Detail'),
      ),
      body: Column(
        children: [
          Text('Welcome ${widget.userName}'),
          Text('Welcome ${widget.fullName}')
        ],
      ),
    );
  }
}

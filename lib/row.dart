import 'package:flutter/material.dart';

class RowCall extends StatefulWidget {
  const RowCall({super.key});

  @override
  State<RowCall> createState() => _RowCallState();
}

class _RowCallState extends State<RowCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('RowCall'),
      ),
      body: Center(
        child: Text('RowCall'),
      ),
    );
  }
}

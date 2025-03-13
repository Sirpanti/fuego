import 'package:flutter/material.dart';

class ColumnCall extends StatefulWidget {
  const ColumnCall({super.key});

  @override
  State<ColumnCall> createState() => _ColumnCallState();
}

class _ColumnCallState extends State<ColumnCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('ColumnCall'),
      ),
      body: Center(
        child: Text('ColumnCall'),
      ),
    );
  }
}

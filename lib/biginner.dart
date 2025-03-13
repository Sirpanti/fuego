import 'package:flutter/material.dart';
import 'package:fuego/john_doe.dart';
import 'package:fuego/routes.dart';

class Beginner extends StatefulWidget {
  const Beginner({super.key});

  @override
  State<Beginner> createState() => _BeginnerState();
}

class _BeginnerState extends State<Beginner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Beginner'),
        ),
        body: Center(
            child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    JohnDoe.id,
                    (Route<dynamic> routes) => false,
                  );
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const JohnDoe(),
                  //     ));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text('Contact Me'),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: Column(
                      children: [
                        Icon(
                          Icons.add_alert,
                          size: 50,
                        ),
                        Text("Beginner")
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Container(
                      color: Colors.redAccent,
                      width: 250.0,
                      height: 40.0,
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("This is Red"),
                      )))),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Container(
                      color: Colors.green,
                      width: 300.0,
                      height: 40.0,
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("This is Green"),
                      )))),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Container(
                      color: Colors.blueAccent,
                      width: 260.0,
                      height: 40.0,
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("This is Blue"),
                      )))),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Container(
                      color: Colors.yellowAccent,
                      width: 300.0,
                      height: 40.0,
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("This is Yellow"),
                      ))))
            ]))));
  }
}

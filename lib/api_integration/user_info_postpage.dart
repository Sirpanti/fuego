import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fuego/api_integration/dio_client.dart';
import 'package:fuego/api_integration/userinfo_body.dart';

class UserInfoPostPage extends StatefulWidget {
  const UserInfoPostPage({super.key});

  @override
  State<UserInfoPostPage> createState() => _UserInfoPostPageState();
}

class _UserInfoPostPageState extends State<UserInfoPostPage> {
  final nameController = TextEditingController();
  final jobController = TextEditingController();
  final dioClient = DioClient();
  bool isLoading = false;
  Future<void> submitdata(String name, String job) async {
    setState(() {
      isLoading = true;
    });
    final response =
        await dioClient.createUser(Userinfobody(name: name, job: job));
    var snackBar = SnackBar(
        content: Text(
            'Name: ${response?.name} - Job: ${response?.job} CreatedAt ${response?.createdAt}'));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserInfoPostPage'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Enter Name'),
          ),
          const SizedBox(
            height: 18,
          ),
          TextFormField(
            controller: jobController,
            decoration: const InputDecoration(labelText: 'Enter Job'),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                submitdata(nameController.text, jobController.text);
              },
              child: Text(isLoading == true ? 'Lading...' : 'Submit Data')),
          ElevatedButton(
              onPressed: () async {
                await dioClient.getUserList();
              },
              child: const Text('Submit Data')),
        ],
      ),
    );
  }
}

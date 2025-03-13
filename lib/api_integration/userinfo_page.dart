import 'package:flutter/material.dart';
import 'package:fuego/api_integration/dio_client.dart';
//import 'package:fuego/api_integration/userinfo.dart';
import 'package:fuego/api_integration/userinfo_body.dart';
import 'package:fuego/api_integration/user_info_list_response.dart';

class UserInfopage extends StatefulWidget {
  final Data user;
  const UserInfopage({super.key, required this.user});

  @override
  State<UserInfopage> createState() => _UserInfopageState();
}

class _UserInfopageState extends State<UserInfopage> {
  final nameController = TextEditingController();
  final jobController = TextEditingController();

  bool isLoading = false;
  final DioClient client = DioClient();
  Future<void> submitdata(String name, String job) async {
    setState(() {
      isLoading = true;
    });
    final response = await client.updateuser(
        widget.user.id!, Userinfobody(name: name, job: job));
    var snackBar = SnackBar(
        content: Text(
            'Name: ${response?.name} - Job: ${response?.job} UpdateddAt ${response?.updatedAt}'));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserInfoPage'),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: client.getUser(widget.user.id.toString()),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final user = snapshot.data;
                  return Column(
                    children: [
                      Image.network('${user?.data?.avatar}'),
                      ElevatedButton(
                          onPressed: () {
                            submitdata(nameController.text, jobController.text);
                          },
                          child: const Text('Click here')),
                      SizedBox(
                        height: 30,
                      ),
                      Text('${user?.data?.firstName} ${user?.data?.lastName}'),
                      SizedBox(height: 30),
                      Text('${user?.data?.email}'),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration:
                            const InputDecoration(labelText: 'Enter Name'),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      TextFormField(
                        controller: jobController,
                        decoration:
                            const InputDecoration(labelText: 'Enter Job'),
                      ),
                    ],
                  );
                } else {
                  return Text('No Data Found');
                }
              })
          //   ElevatedButton(
          //     onPressed: () {
          //       client.getUser('3');
          //     },
          //     child: const Text('Edit Profile'),
          //   ),
        ],
      ),
    );
  }
}

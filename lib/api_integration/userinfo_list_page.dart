import 'package:flutter/material.dart';
import 'package:fuego/api_integration/dio_client.dart';
import 'package:fuego/api_integration/userinfo_page.dart';

class UserinfoListPage extends StatefulWidget {
  const UserinfoListPage({super.key});

  @override
  State<UserinfoListPage> createState() => _UserinfoListPageState();
}

class _UserinfoListPageState extends State<UserinfoListPage> {
  final client = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UserInfoPage'),
        ),
        body: Center(
            child: FutureBuilder(
                future: client.getUserList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final users = snapshot.data;
                    return ListView.builder(
                      itemCount: users?.data?.length,
                      itemBuilder: (context, index) {
                        final user = users?.data?[index];
                        return ListTile(
                            leading: Image.network('${user?.avatar}'),
                            title: Text('${user?.firstName} ${user?.lastName}'),
                            subtitle: Text('${user?.email}'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UserInfopage(user: user!),
                                  ));
                            });
                      },
                    );
                  } else {
                    return const Text('No Data Found');
                  }
                })));
  }
}

import 'package:flutter/material.dart';
import 'package:users_test/model_user.dart';
import 'package:users_test/rest_user.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final RESTUser restUser = RESTUser();
  late Future<List<ModelUser>?> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = restUser.getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: FutureBuilder(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text('Error fetching data.'));
          }

          final List<ModelUser> users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return ListTile(title: Text(user.name!), subtitle: Text(user.email!));
            },
          );
        },
      ),
    );
  }
}

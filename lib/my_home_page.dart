import 'package:flutter/material.dart';
import 'package:users_test/model_user.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.futureUsers});
  final String title;
  final Future<List<ModelUser>?> futureUsers;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: FutureBuilder(
        future: widget.futureUsers,
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

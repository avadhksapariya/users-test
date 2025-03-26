import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:users_test/model_user.dart';
import 'package:users_test/my_home_page.dart';

void main() {
  testWidgets('Displays the list of users with title as name and subtitle as email', (widgetTester) async {
    final List<ModelUser> users = [
      ModelUser(id: 1, name: "Avadh", username: "avadh", email: "aks@yopmail.com"),
      ModelUser(id: 2, name: "Brian", username: "brian", email: "brn@yopmail.com"),
    ];

    Future<List<ModelUser>> mockGetUserList() async {
      return Future.delayed(Duration(seconds: 1), () => users);
    }

    await widgetTester.pumpWidget(MaterialApp(home: MyHomePage(title: 'Users Test', futureUsers: mockGetUserList())));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await widgetTester.pumpAndSettle();

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(users.length));

    for (final user in users) {
      expect(find.text(user.name!), findsOneWidget);
      expect(find.text(user.email!), findsOneWidget);
    }
  });
}

/*

Also, there's an another a much more complex way for it,
which basically includes mocking with mockito package,
stubbing the behaviour of the httpClient similar to Unit testing.

*/

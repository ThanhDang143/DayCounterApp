import 'package:daycounter/views/Homepage.dart';
import 'package:flutter/material.dart';

Widget appBar(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.orangeAccent.withOpacity(0.1),
  );
}

Widget feature(BuildContext context, Widget otherScreen, String featureName) {
  return ListTile(
    title: Text(featureName),
    onTap: () {
      Navigator.pop(context);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => otherScreen),
      );
    },
  );
}

Widget drawer(BuildContext context, String usn, String email) {
  return Drawer(
    child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(usn),
          accountEmail: Text(email),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
          ),
        ),
        feature(context, HomePage(), 'Pick BG'),
      ],
    ),
  );
}
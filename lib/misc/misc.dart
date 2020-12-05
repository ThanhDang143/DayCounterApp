import 'package:daycounter/views/About.dart';
import 'package:daycounter/views/Countdown.dart';
import 'package:daycounter/views/Homepage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

Widget appBar(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.orangeAccent.withOpacity(0.01),
  );
}

Widget feature(BuildContext context, String featureName) {
  return ListTile(
    title: Text(featureName),
    onTap: () {
      // pickFile();
    },
  );
}

Widget featureX(BuildContext context, Widget otherScreen, String featureName) {
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
        featureX(context, HomePage(), 'Day Counter'),
        featureX(context, Countdown(), 'Time Countdown'),
        featureX(context, About(), 'About'),
        feature(context, '(Coming soon)'),
      ],
    ),
  );
}

pickFile() async {
  FilePickerResult result = await FilePicker.platform.pickFiles();

  if (result != null) {
    PlatformFile file = result.files.first;

    print(file.name);
    print(file.size);
    print(file.extension);
  } else {
    print('Cancel');
  }
}

Widget fromDurationToDataTime(int seconds) {
  int secondsLeft = seconds % 60;

  int minute = (seconds - secondsLeft) ~/ 60;
  int minuteLeft = minute % 60;

  int hour = (minute - minuteLeft) ~/ 60;
  int hourLeft = hour % 24;

  int day = (hour - hourLeft) ~/ 24;
  int dayLeft = day % 30;

  int month = (day - dayLeft) ~/ 30;
  int monthLeft = month % 12;

  int year = (month - monthLeft) ~/ 12;
  int yearLeft = year % 12;

  Widget row(int number, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('${number.toString().padLeft(2, '0')}',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w200)),
        Text(' $text'),
      ],
    );
  }

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          row(yearLeft, 'year'),
          SizedBox(width: 20),
          row(monthLeft, 'month'),
          SizedBox(width: 20),
          row(dayLeft, 'day'),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          row(hourLeft, 'hour'),
          SizedBox(width: 20),
          row(minuteLeft, 'minute'),
          SizedBox(width: 20),
          row(secondsLeft, 'second'),
        ],
      ),
    ],
  );
}

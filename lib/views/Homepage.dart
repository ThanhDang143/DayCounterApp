import 'dart:async';

import 'package:daycounter/misc/misc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int time;
  DateTime fromDate;
  DateTime toDate;

  @override
  void initState() {
    time = 0;
    fromDate = DateTime(2020, 7, 24);
    toDate = DateTime.now();
    Timer.periodic(Duration(microseconds: 1), (Timer t) => _differenceTime());
    super.initState();
  }

  void _differenceTime() {
    if (toDate.difference(DateTime.now()).inDays == 0) {
      setState(() {
        time = DateTime.now().difference(fromDate).inSeconds;
      });
    } else {
      setState(() {
        time = toDate.difference(fromDate).inSeconds;
      });
    }
  }

  Future<Null> _selectToDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: toDate,
        firstDate: DateTime(1998),
        lastDate: DateTime(2098));
    if (picked != null && picked != toDate)
      setState(() {
        toDate = picked;
      });
  }

  Future<Null> _selectFromDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: fromDate,
        firstDate: DateTime(1998),
        lastDate: DateTime(2098));
    if (picked != null && picked != fromDate)
      setState(() {
        fromDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'live.staticflickr.com/65535/50681491962_ed9db5e82e_c.jpg',
            fit: BoxFit.cover,
          ),
          Scaffold(
            // backgroundColor: Colors.transparent,
            appBar: appBar("Thanhhh's Counter"),
            drawer: drawer(context, 'Đặng Văn Thanh', 'vanthanh1998@gmail.com'),
            body: Center(
              child: Column(
                children: [
                  SizedBox(height: 1.5 * heightScreen / 10),
                  fromDurationToDataTime(time),
                  SizedBox(height: 3.5 * heightScreen / 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          _selectFromDate(context);
                        },
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Colors.red,
                                Colors.orange,
                                Colors.yellow,
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('From'),
                              Text(
                                  '${fromDate.day.toString().padLeft(2, '0')}/${fromDate.month.toString().padLeft(2, '0')}/${fromDate.year}'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: widthScreen / 5),
                      RaisedButton(
                        onPressed: () {
                          _selectToDate(context);
                        },
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Colors.yellow,
                                Colors.orange,
                                Colors.red,
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('To'),
                              Text(
                                  '${toDate.day.toString().padLeft(2, '0')}/${toDate.month.toString().padLeft(2, '0')}/${toDate.year}'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:daycounter/misc/misc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Countdown extends StatefulWidget {
  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  int time;
  DateTime fromDate;
  TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    time = 0;
    fromDate = DateTime.now();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _countdown());
    super.initState();
  }

  void _countdown() {
    if (time > 0) {
      setState(() {
        time--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

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
                  Text('$time',
                      style:
                          TextStyle(fontSize: 75, fontWeight: FontWeight.w500)),
                  Text(' seconds'),
                  SizedBox(height: 2.5 * heightScreen / 10),
                  Card(
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      showCursor: false,
                      maxLength: 4,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: _textEditingController,
                      textCapitalization: TextCapitalization.sentences,
                      autofocus: true,
                      decoration: InputDecoration(
                          hintText: 'Seconds', border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(height: 1 * heightScreen / 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            time = int.parse(_textEditingController.text);
                            _textEditingController.text = '';
                          });
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
                              horizontal: 30, vertical: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Start', style: TextStyle(fontSize: 30)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: widthScreen / 5),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            time = 0;
                            _textEditingController.text = '';
                          });
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
                              Text('Cancel', style: TextStyle(fontSize: 30)),
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

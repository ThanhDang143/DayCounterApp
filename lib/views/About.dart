import 'package:daycounter/misc/misc.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'images/y.JPG',
            fit: BoxFit.cover,
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: appBar('About Me'),
              drawer:
                  drawer(context, 'Đặng Văn Thanh', 'vanthanh1998@gmail.com'),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Đặng Văn Thanh', style: TextStyle(fontSize: 50),),
                    Text('vanthanh1998@gmail.com', style: TextStyle(fontSize: 20),),
                    Text('0358040000', style: TextStyle(fontSize: 20),),
                    Text('Tiền Phong - Mê Linh - Hà Nội', style: TextStyle(fontSize: 20),),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

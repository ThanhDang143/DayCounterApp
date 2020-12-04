import 'package:daycounter/misc/misc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://lh3.googleusercontent.com/ZcfyYB3o3S25tnwoXvm97E7gockDTs-BMKvLQ8vOZudAWOv_bytku5pdS4AuVDFziNZ1LUcgMHyPPKoG1BL14xUoqTWsUeau1fiEYWwtluKImLFw5XdgwhGCkoC5J7XPaIdbMmgr3oxXoW1MFj4kr_I87fTXbzm7naFrl3m3HG5TwE2h-pz38VJo_qz-7BybcM4k2BIXZNJ0mF5_wky1OR_U8H9kM-xDAmwJIxcJgzHKXY8DCureKpDQuFEco9eebMDCdYtsj1NiQwPEFBDFbhFJTMdHPCm7vtcW0rsalTRSPvbnD81zQTaF1B5f-m3FhzAe2jRGh1Y2qFRqQqe7XM6B6j-LD1Xusx5bMOReb9gqRAvuTKLF1whQ8ZBhWG6VOAtjOQZXdw6hkBmvMbSuxRoft9b5-JyBVdKfsV_Yq_qhtFoKZkADQyo908LBELqWVRlfO8_aJY4HgqpAWiRxo2-bqneohrEmWqaWEeVOzYNrS13wSFPXkweAgZhyOEw1JBzoe8XS1qgay3sIyZtnUy6GtFW2_3L-LC7owmmlWFLBI8n4uSz8eDHWrH8dy5w2qKZg4KKEJ38q1nPYhklYllD1F_utIIRTUs09RwctG4KX4uX7YLZRR9U1utgBeVtQkUTn6pD6WHP_nfjSQtNt59hwm8KJglCYzfJYAtz2RTwoY49ajs-aRee-cI7j=w945-h695-no?authuser=0',
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: appBar("Thanhhh's Counter"),
            drawer: drawer(context, 'Đặng Văn Thanh', 'vanthanh1998@gmail.com'),
          )
        ],
      ),
    );
  }
}

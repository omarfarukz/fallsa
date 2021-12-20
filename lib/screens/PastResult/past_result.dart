import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallsa/screens/MainMenu/menue_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fallsa/screens/PastResult//components/CarouselWithDotsPage.dart';
import 'package:intl/intl.dart';

class PastResultScreen extends StatefulWidget {
  @override
  _PastResultScreen createState() => _PastResultScreen();
}

class _PastResultScreen extends State<PastResultScreen> {
  @override
  void initState() {
    readData();
    super.initState();
  }

  final List<String> imgList = [
    'https://static.bhphoto.com/images/images500x500/Savage_46_12_107_x_12yds_Background_1157995639_45497.jpg',
    'https://static.bhphoto.com/images/images500x500/Savage_46_12_107_x_12yds_Background_1157995639_45497.jpg',
    'https://static.bhphoto.com/images/images500x500/Savage_46_12_107_x_12yds_Background_1157995639_45497.jpg',
    'https://static.bhphoto.com/images/images500x500/Savage_46_12_107_x_12yds_Background_1157995639_45497.jpg',
    'https://static.bhphoto.com/images/images500x500/Savage_46_12_107_x_12yds_Background_1157995639_45497.jpg',
  ];
  List data = [];
  List filterData = [];
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  // final String formatted = formatter.format(now);
// readData() {
//   FirebaseFirestore.instance
//       .collection('quiz1')
//       .get() //How to get data using UID here
//       .then((QuerySnapshot querySnapshot) {
//     querySnapshot.docs.forEach((doc) {
//       print(doc["correct"]);
//       // if (doc['uid'] == 'a6Zto5xnPcP5WE6yLHzcRq4i9Qn1') {
//       //   data = querySnapshot.docs;
//       //   // data = doc.data().values.toList();
//     }

//         // print(doc['number']);
//         // print(data.length);
//         // }
//         );
//   });
// }
  readData() {
    FirebaseFirestore.instance
        .collection('quiz1')
        .get()
        .then((QuerySnapshot querySnapshot) {
      // data = querySnapshot.docs;
      // print(doc["correct"]);
      // if (doc['uid'] == 'a6Zto5xnPcP5WE6yLHzcRq4i9Qn1') {
      data = querySnapshot.docs;
      //   // data = doc.data().values.toList();
      // print(doc['number']);
      // print(data.length);
      // }
      // );
      // print(data[1]['correct']);

      for (int i = 0; i < data.length; i++) {
        if (data[i]['uid'] == 'a6Zto5xnPcP5WE6yLHzcRq4i9Qn1') {
          data[i].print("Main Data ${data[i]}");
          filterData = data[i];
          print("Filter Data ${filterData}");
          // print('I am here');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.lightGreen[50],
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.green[300],
            title: Text(
              "Past Results",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 33,
                  fontWeight: FontWeight.bold),
            ),
            leading: BackButton(
              color: Colors.black,
            ),
          ),
          body: Column(
            children: [
              TabBar(
                indicatorColor: Colors.green,
                labelColor: Colors.green,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text(
                      'Falls Risk Result',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Strength Test',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(16.0),
                      ),
                      child: Ink(
                        child: ListView.builder(
                          itemCount: 15,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Ink(
                                child: Container(
                                  decoration: new BoxDecoration(
                                    borderRadius:
                                        new BorderRadius.circular(20.0),
                                    color: Colors.green[200],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      // need total three values, 1.Date, 2. Score, 3. Based on the score we display the risk factor
                                      Text(
                                        // formatted,
                                        '',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Score: 3',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Low Risk',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Ink(
                        child: ListView.builder(
                          itemCount: 15,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Ink(
                                child: Container(
                                  decoration: new BoxDecoration(
                                    borderRadius:
                                        new BorderRadius.circular(20.0),
                                    color: Colors.green[200],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // need total two values, 1.Date, 2. Score
                                      Text(
                                        // formatted,
                                        '',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Score: 5 times',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

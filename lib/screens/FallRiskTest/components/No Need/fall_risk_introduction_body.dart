// import 'package:fallsa/screens/MainMenu/menue_screen.dart';
// import 'package:flutter/material.dart';
// import '../../first_attempt.dart';
// import '../background.dart';

// class FallRiskIntroductionBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Container(
//       child: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               // SizedBox(height: size.height * 0.06),
//               Stack(
//                 //alignment: Alignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     "assets/images/green_top.png",
//                     width: 130,
//                   ),
//                   // Stroked text as border.
//                   // Solid text as fill.
//                   SizedBox(
//                     height: 100,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(30, 80, 0, 0),
//                     child: Row(
//                       children: [
//                         Text(
//                           'Introduction',
//                           style: TextStyle(
//                             fontSize: 50,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.volume_up_sharp),
//                           disabledColor: Colors.green[900],
//                           iconSize: 48,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               // Divider(
//               //   height: 20,
//               //   thickness: 5,
//               // ),
//               Divider(
//                 height: 20,
//                 thickness: 5,
//                 indent: 15,
//                 endIndent: 15,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SingleChildScrollView(
//                   child: Text(
//                     "FallSA (Falls Screening Application) offers seniors a tool self-examination to inform fall risk based studies conducted in Malaysia. This app has the potential to create awareness among seniors about the importance of early risk screening falls so as to assist in the process of early treatment and prevention. The data in this mobile application will handled as medical records as set forth in Data Protection Disclaimer and Laws of Malaysia ACT 709; Personal Data Protection Act 2010. The mobile app only notifies the risk of a fall and does not make a diagnosis or suggest dose changes current medicine.",
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.justify,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               IconButton(
//                 icon: Icon(Icons.volume_up_sharp),
//                 disabledColor: Colors.green[900],
//                 iconSize: 48,
//               ),
//               Text(
//                 "Click here to listen",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               IconButton(
//                 icon: Icon(Icons.ondemand_video_rounded),
//                 disabledColor: Colors.green[900],
//                 iconSize: 48,
//               ),
//               Text(
//                 "Click here to watch instruction video",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),

//               ElevatedButton(
//                 child: Text(
//                   'Start Test',
//                   style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   shape: new RoundedRectangleBorder(
//                     borderRadius: new BorderRadius.circular(20.0),
//                   ),
//                   primary: Colors.green[400],
//                   padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
//                 ),
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return FirstAttempt();
//                       },
//                     ),
//                   );
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(240, 0, 0, 0),
//                 child: Image.asset(
//                   "assets/images/green_bottom.png",
//                   width: 180,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

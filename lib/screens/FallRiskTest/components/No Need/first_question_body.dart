// import 'package:fallsa/screens/Disclaimer/disclaimer_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:fallsa/screens/FallRiskTest/components/background.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// import '../../fall_risk_introduction.dart';

// // import 'package:geoflutterfire/geoflutterfire.dart';
// // import 'package:logger/logger.dart';
// String walkingAid;

// class FirstQuestionBody extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     final _formKey = useMemoized(() => GlobalKey<FormState>());
//     // final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
//     final Size size = MediaQuery.of(context).size;
//     return Background(
//       child: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(height: size.height * 0.25),
//               Image.asset(
//                 "assets/progressbar/one.png",
//                 width: 160,
//               ),
//               SizedBox(height: size.height * 0.01),
//               const Text(
//                 "Are you using walking aid?",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 50,
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: size.height * 0.05),
//               Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 TextButton(
//                     child: Text("Yes".toUpperCase(),
//                         style: TextStyle(
//                             fontSize: 22,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold)),
//                     style: ButtonStyle(
//                         padding: MaterialStateProperty.all<EdgeInsets>(
//                             EdgeInsets.fromLTRB(75, 15, 75, 15)),
//                         foregroundColor:
//                             MaterialStateProperty.all<Color>(Colors.white),
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                           Colors.green[400],
//                         ),
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(18.0),
//                                     side: BorderSide(
//                                       color: Colors.green[800],
//                                     )))),
//                     onPressed: () {
//                       walkingAid = 'Yes';
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => FallRiskIntroduction(
//                             walkingAid: walkingAid,
//                           ),
//                         ),
//                       );
//                     }),
//                 SizedBox(width: 10),
//                 TextButton(
//                     child: Text("No".toUpperCase(),
//                         style: TextStyle(
//                             fontSize: 22,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold)),
//                     style: ButtonStyle(
//                         padding: MaterialStateProperty.all<EdgeInsets>(
//                             EdgeInsets.fromLTRB(75, 15, 75, 15)),
//                         foregroundColor:
//                             MaterialStateProperty.all<Color>(Colors.white),
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(Colors.red[400]),
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(18.0),
//                                     side: BorderSide(color: Colors.red[800])))),
//                     onPressed: () {
//                       walkingAid = 'No';
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => FallRiskIntroduction(
//                             walkingAid: walkingAid,
//                           ),
//                         ),
//                       );
//                     })
//               ]),
//               SizedBox(height: size.height * 0.319),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

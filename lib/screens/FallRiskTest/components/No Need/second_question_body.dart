// import 'package:fallsa/screens/Disclaimer/disclaimer_screen.dart';
// import 'package:fallsa/screens/MainMenu/menue_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:fallsa/screens/FallRiskTest/components/background.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';



// // import 'package:geoflutterfire/geoflutterfire.dart';
// // import 'package:logger/logger.dart';

// class SecondQuestionBody extends HookWidget {
//   final double firstAttemp;
//   final double secondAttemp;
//   String secondQuestion;

//   SecondQuestionBody({this.firstAttemp, this.secondAttemp});
//   @override
//   Widget build(BuildContext context) {
//     // final _formKey = useMemoized(() => GlobalKey<FormState>());
//     // final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
//     final Size size = MediaQuery.of(context).size;
//     return Background(
//       child: SingleChildScrollView(
//         child: Form(
//           // key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(height: size.height * 0.15),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(50, 60, 0, 0),
//                 child: Image.asset(
//                   "assets/progressbar/sixty.png",
//                   width: 200,
//                 ),
//               ),
//               SizedBox(height: size.height * 0.01),
//               const Text(
//                 "Are you worried of falling?",
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
//                       secondQuestion = 'Yes';
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ThirdQuestion(),
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
//                       secondQuestion = 'No';
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ThirdQuestion(
//                             firstAttemp: firstAttemp,
//                             seceondAttemp: secondAttemp,
//                             secondQuestion: secondQuestion,
//                           ),
//                         ),
//                       );
//                     }),
//               ]),
//               SizedBox(height: 520),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

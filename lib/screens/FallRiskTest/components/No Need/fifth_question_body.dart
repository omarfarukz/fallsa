// import 'package:fallsa/screens/Disclaimer/disclaimer_screen.dart';
// import 'package:fallsa/screens/MainMenu/menue_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fallsa/screens/FallRiskTest/components/background.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// import '../../fall_risk_introduction.dart';
// import '../../report.dart';

// // import 'package:geoflutterfire/geoflutterfire.dart';
// // import 'package:logger/logger.dart';

// class FifthQuestionBody extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     final _formKey = useMemoized(() => GlobalKey<FormState>());
//     // final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
//     final Size size = MediaQuery.of(context).size;
//     return Background(
//       child: SingleChildScrollView(
//       child: Form(
//       key: _formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           SizedBox(height: 60),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
//             child: Image.asset(
//               "assets/progressbar/ninety.png",
//               width: 150,
//             ),
//           ),
//           SizedBox(height: size.height * 0.01),
//           const Text(
//             "Are you having cataract or glaucoma?",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, color: Colors.black,),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: size.height * 0.02),
//           Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextButton(
//                     child: Text(
//                         "Yes".toUpperCase(),
//                         style: TextStyle(fontSize: 22,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold)
//                     ),
//                     style: ButtonStyle(
//                         padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(75, 15, 75, 15)),
//                         foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                         backgroundColor: MaterialStateProperty.all<Color>(Colors.green[400],),
//                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(18.0),
//                                 side: BorderSide(color: Colors.green[800],)
//                             )
//                         )
//                     ),
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => Report(),
//                         ),
//                       );
//                     }
//                 ),
//                 SizedBox(width: 10),
//                 TextButton(
//                     child: Text(
//                         "No".toUpperCase(),
//                         style: TextStyle(fontSize: 22,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold)
//                     ),
//                     style: ButtonStyle(
//                         padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(75, 15, 75, 15)),
//                         foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                         backgroundColor: MaterialStateProperty.all<Color>(Colors.red[400]),
//                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(18.0),
//                                 side: BorderSide(color: Colors.red[800])
//                             )
//                         )
//                     ),
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => Report(),
//                         ),
//                       );
//                     }
//                 )
//               ]
//           ),
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: const Text(
//               "* Cataract is a clouding of the lens in the eye that affects vision (National Eye Institute, 2015).",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black,),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: const Text(
//               "* Glaucoma is a group of diseases that damage the eye's optic nerve and can result in vision loss and blindess(National Eye Institute, 2016).",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black,),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           SizedBox(height: size.height * 0.2),
//         ],
//       )
//     )
//     )
//     );
//   }
// }

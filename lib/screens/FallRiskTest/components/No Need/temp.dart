// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'dart:async';
// import '../fall_risk_introduction.dart';

// class ElapsedTime {
//   final int hundreds;
//   final int seconds;
//   final int minutes;

//   ElapsedTime({
//     this.hundreds,
//     this.seconds,
//     this.minutes,
//   });
// }

// class Dependencies {

//   final List<ValueChanged<ElapsedTime>> timerListeners = <ValueChanged<ElapsedTime>>[];
//   final TextStyle textStyle = const TextStyle(fontSize: 90.0, fontFamily: "Bebas Neue");
//   final Stopwatch stopwatch = new Stopwatch();
//   final int timerMillisecondsRefreshRate = 30;
// }


// // import 'package:geoflutterfire/geoflutterfire.dart';
// // import 'package:logger/logger.dart';

// class FirstAttemptBody extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     final _formKey = useMemoized(() => GlobalKey<FormState>());
//     // final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
//     final Size size = MediaQuery.of(context).size;
//     return Container(
//       child: Stack(
//         alignment: Alignment.center,
//         children: <Widget>[
//           Positioned(
//             top: 0,
//             left: 0,
//             child: Image.asset(
//               "assets/images/green_top.png",
//               width: 200 ,
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 240,
//             child: Image.asset(
//               "assets/images/green_bottom.png",
//               width: 180,
//             ),
//           ),
//           Center(
//               child: ListView(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
//                     child: Center(
//                       child: Text(
//                         'Test',
//                         style: TextStyle(
//                           fontSize: 50,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Center(
//                     child: Text(
//                       'First Attempt',
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),

//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

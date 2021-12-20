import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallsa/screens/Guideline/guideline_screen.dart';
import 'package:fallsa/screens/MainMenu/menue_screen.dart';
import 'package:fallsa/screens/Resetpassword/reset_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:fallsa/screens/home_screen.dart';
import 'package:fallsa/components/already_have_an_account_acheck.dart';
import 'package:fallsa/Screens/Signup/signup_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  TextEditingController pincontroller = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential?.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  phoneAuth() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+6" + phoneController.text.toString(),
      timeout: Duration(seconds: 120),
      verificationCompleted: (PhoneAuthCredential credential) async {
        var result = await _auth.signInWithCredential(credential);
        User user = result.user;
        if (user != null) {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => GuidelineScreen()));
        }
      },
      verificationFailed: (FirebaseAuthException excption) {
        print(excption);
      },
      codeSent: (String verificationID, int resendToken) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('OTP'),
                content: Column(
                  children: [
                    TextField(
                      controller: pincontroller,
                    ),
                    RaisedButton(
                      onPressed: () async {
                        var smscode = pincontroller.text;
                        PhoneAuthCredential phoneAuthCredential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationID,
                                smsCode: smscode);
                        var result = await _auth
                            .signInWithCredential(phoneAuthCredential);
                        User user = result.user;
                        if (user != null) {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => GuidelineScreen()));
                        }
                      },
                      child: Text("OTP"),
                    ),
                  ],
                ),
              );
            });
      },
      codeAutoRetrievalTimeout: (String verificationID) {},
    );
  }

  getMobileFormWidget(context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/green_top.png",
              width: 200,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 30,
            child: Image.asset(
              "assets/images/ukm_logo.png",
              width: 160,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 210,
            child: Image.asset(
              "assets/images/hcare_logo.png",
              width: 160,
            ),
          ),
          Center(
            child: ListView(
              children: [
                Center(child: SizedBox(height: 60)),
                SizedBox(height: 50),
                Image.asset(
                  "assets/images/menu_one.png",
                  width: 0,
                  height: 220,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextFormField(
                    autofocus: false,
                    enabled: true,
                    controller: phoneController,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.fromLTRB(20, 0, 0, 0),
                      hintText: "Phone Number",
                      hintStyle: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.0),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                    ),
                    style: TextStyle(fontSize: 22.0, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      phoneAuth();
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                        primary: Colors.green[400],
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                        textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forget Password? ",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ResetPassword();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Click here',
                        style: TextStyle(
                            color: Colors.indigo[900],
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        TextField(
          controller: otpController,
          decoration: InputDecoration(
            hintText: "Enter OTP",
          ),
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: Text("VERIFY"),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen[50],
        key: _scaffoldKey,
        body: Container(
          child: showLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
          // padding: const EdgeInsets.all(16),
        ));
  }
}

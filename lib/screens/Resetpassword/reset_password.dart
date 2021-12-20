import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:fallsa/screens/home_screen.dart';
import 'package:fallsa/components/already_have_an_account_acheck.dart';
import 'package:fallsa/Screens/Signup/signup_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

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

      if(authCredential?.user != null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      }

    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
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
              width: 200 ,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 240,
            child: Image.asset(
              "assets/images/green_bottom.png",
              width: 180,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
              child: ListView(
                children: [
                  Center(child: SizedBox(height: 60)),
              SizedBox(
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.fromLTRB(20, 0, 0, 0),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(fontSize: 22.0, color: Colors.black, ),
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
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      // controller: phoneController,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.fromLTRB(20, 0, 0, 0),
                        hintText: "Enter Your New Password",
                        hintStyle: TextStyle(fontSize: 22.0, color: Colors.black,),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                      style: TextStyle(fontSize: 22.0, color: Colors.black,),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          showLoading = true;
                        });

                        await _auth.verifyPhoneNumber(
                          phoneNumber: phoneController.text,
                          verificationCompleted: (phoneAuthCredential) async {
                            setState(() {
                              showLoading = false;
                            });
                            //signInWithPhoneAuthCredential(phoneAuthCredential);
                          },
                          verificationFailed: (verificationFailed) async {
                            setState(() {
                              showLoading = false;
                            });
                            _scaffoldKey.currentState.showSnackBar(
                                SnackBar(content: Text(verificationFailed.message)));
                          },
                          codeSent: (verificationId, resendingToken) async {
                            setState(() {
                              showLoading = false;
                              currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                              this.verificationId = verificationId;
                            });
                          },
                          codeAutoRetrievalTimeout: (verificationId) async {},
                        );
                      },
                      child: Text("Confirm"),
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                          primary: Colors.green[500],
                          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                          textStyle: TextStyle(
                            color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,)),
                    ),
                  ),
              const SizedBox(
                      height: 5.0,
                    ),
                ],
              ),
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
                verificationId: verificationId, smsCode: otpController.text);

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
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            ' Reset Password',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 33,
                color: Colors.black,
                fontFamily: 'Raleway'
            ),
          ),
          leading: BackButton(
            color: Colors.black,
          ),

          backgroundColor: Colors.green[400],
        ),
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

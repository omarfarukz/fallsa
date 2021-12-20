import 'package:fallsa/Screens/Signup/components/custom_drop_down.dart';
import 'package:fallsa/screens/Guideline/guideline_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fallsa/Screens/Login/login_screen.dart';
import 'package:fallsa/Screens/Signup/components/background.dart';
import 'package:fallsa/components/already_have_an_account_acheck.dart';
import 'package:fallsa/components/rounded_button.dart';
import 'package:fallsa/components/rounded_input_field.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'custom_drop_down_states.dart';

// import 'package:geoflutterfire/geoflutterfire.dart';
// import 'package:logger/logger.dart';
User user;

class Body extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController email = useTextEditingController(text: "");
    final TextEditingController password = useTextEditingController(text: "");
    final TextEditingController name = useTextEditingController(text: "");
    final TextEditingController ic = useTextEditingController(text: "");
    final TextEditingController phoneNumber =
        useTextEditingController(text: "");
    final TextEditingController state = useTextEditingController();
    final TextEditingController gender = useTextEditingController();
    final TextEditingController address1 = useTextEditingController(text: "");
    final TextEditingController address2 = useTextEditingController(text: "");
    final TextEditingController postCode = useTextEditingController(text: "");
    final TextEditingController age = useTextEditingController(text: "");
    final List<String> states = [
      "Johor",
      "Kedah",
      "Kelantan",
      "Malacca",
      "Negeri",
      "Sembilan",
      "Pahang",
      "Perak"
          "Perlis",
      "Sabah",
      "Sarawak",
      "Selangor",
      "Terengganu",
      "Federal Territory of KL",
      "Federal Territory of Labuan",
      "Federal Territory of Putrajaya"
    ];
    final List<String> genders = ["Male", "Female"];

    final _auth = FirebaseAuth.instance;
    final _firebase = FirebaseFirestore.instance;
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    // final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    final Size size = MediaQuery.of(context).size;
    final _formkey1 = GlobalKey<FormState>();
    CollectionReference details =
        FirebaseFirestore.instance.collection('details');
    var icm;
    TextEditingController pincontroller = TextEditingController();

    phoneAuth() async {
      await _auth.verifyPhoneNumber(
        phoneNumber: "+6" + phoneNumber.text.toString(),
        timeout: Duration(seconds: 120),
        verificationCompleted: (PhoneAuthCredential credential) async {
          var result = await _auth.signInWithCredential(credential);
          User user = result.user;
          if (user != null) {
            await FirebaseFirestore.instance
                .collection('userDetails')
                .doc(user.uid)
                .set({
              'number': phoneNumber.text,
              'name': name.text,
              'ic': ic.text,
              'age': age.text,
              'gander': gender.text,
              'adress1': address1.text,
              'adress2': address2.text,
              'phonenumber': phoneNumber.text,
              'postcode': postCode.text,
              'state': state.text,
            });
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
                  title: Text('Enter the code'),
                  content: Column(
                    children: [
                      TextField(
                        controller: pincontroller,
                      ),
                      RaisedButton(onPressed: () async {
                        var smscode = pincontroller.text;
                        PhoneAuthCredential phoneAuthCredential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationID,
                                smsCode: smscode);
                        var result = await _auth
                            .signInWithCredential(phoneAuthCredential);
                        User user = result.user;
                        if (user != null) {
                          await FirebaseFirestore.instance
                              .collection('userDetails')
                              .doc(user.uid)
                              .set({
                            'number': phoneNumber.text,
                            'name': name.text,
                            'ic': ic.text,
                            'age': age.text,
                            'gander': gender.text,
                            'adress1': address1.text,
                            'adress2': address2.text,
                            'phonenumber': phoneNumber.text,
                            'postcode': postCode.text,
                            'state': state.text,
                          });
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => GuidelineScreen()));
                        }
                      })
                    ],
                  ),
                );
              });
        },
        codeAutoRetrievalTimeout: (String verificationID) {},
      );
    }

    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage("assets/images/oldlady.png"),
                ),
              ),
              RoundedInputField(
                name,
                hintText: "Full name",
              ),
              RoundedInputField(
                ic,
                hintText: "IC number",
              ),
              SizedBox(
                child: RoundedInputField(
                  age,
                  hintText: "Age",
                ),
              ),
              CustomDropDown(
                colors: Colors.black,
                options: genders,
                title: "Gender",
                controller: gender,
              ),
              RoundedInputField(
                address1,
                hintText: "Address 1",
                inputType: InputFieldType.address1,
              ),
              RoundedInputField(
                address2,
                hintText: "Address 2",
                inputType: InputFieldType.address2,
              ),
              RoundedInputField(
                phoneNumber,
                hintText: "Phone Number",
                inputType: InputFieldType.phone,
              ),
              RoundedInputField(
                postCode,
                hintText: "Post Code",
              ),
              CustomDropDownStates(
                colors: Colors.black,
                options: states,
                title: "States",
                controller: state,
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Sending data to database")));

                  phoneAuth();
                },
              ),
              SizedBox(height: size.height * 0.01),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}

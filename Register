import 'Home.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'SignInAuth.dart';


class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);


  @override
  RegisterPageState createState() => RegisterPageState();

}


class _RegisterPageState extends State<SignInPage> {
  //Check Box
  bool agreeVal = false;

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;
  TextEditingController phoneNumberController;
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController locationController;
  TextEditingController usernameController;
  TextEditingController paypalController;


  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
    phoneNumberController = new TextEditingController();
    firstNameController = new TextEditingController();
    lastNameController = new TextEditingController();
    locationController = new TextEditingController();
    usernameController = new TextEditingController();
    paypalController = new TextEditingController();

    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String usernameValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'username is required';
    } else {
      return null;
    }
  }

  String phoneValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Phone Number format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  String firstNameValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'First Name format is invalid';
    } else {
      return null;
    }
  }

  String lastNameValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Last Name format is invalid';
    } else {
      return null;
    }
  }

  String locationValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Location format is invalid';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Form(
                    key: _registerFormKey,
                    child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'First Name*',
                                hintText: "John"),
                            controller: firstNameController,
                            validator: firstNameValidator,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Last Name*',
                                hintText: "Doe"),
                            controller: lastNameController,
                            validator: lastNameValidator,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Username (Bar Number)*',
                                hintText: "12345"),
                            controller: usernameController,
                            validator: usernameValidator,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Password*', hintText: "********"),
                            controller: pwdInputController,
                            obscureText: true,
                            validator: pwdValidator,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Confirm Password*',
                                hintText: "********"),
                            controller: confirmPwdInputController,
                            obscureText: true,
                            validator: pwdValidator,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Email*',
                                hintText: "john.doe@gmail.com"),
                            controller: emailInputController,
                            validator: emailValidator,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Phone Number*',
                                hintText: "xxx-xxx-xxxx"),
                            controller: phoneNumberController,
                            validator: emailValidator,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Location*',
                                hintText: "Cleveland, OH"),
                            controller: locationController,
                            validator: locationValidator,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Paypal',
                                hintText: "Paypal Link"),
                            controller: paypalController,
                          ),
                          //Checkbox Field
                          Text(" "),
                          Text("* = Required"),
                          Text (" "),
                          Text("By checking this box you agree to the Terms and Conditions"),
                          Checkbox(
                              value: agreeVal,
                              onChanged: (bool value){
                                setState((){
                                  agreeVal = value;
                                });
                              }
                          ),

                          RaisedButton(
                            child: Text("Register"),
                            color: Theme
                                .of(context)
                                .primaryColor,
                            textColor: Colors.white,
                            onPressed: () {
                              if (_registerFormKey.currentState.validate()) {
                                if (pwdInputController.text ==
                                    confirmPwdInputController.text) {
                                  FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                      email: emailInputController.text,
                                      password: pwdInputController.text)
                                      .then((currentUser) =>
                                      Firestore.instance
                                          .collection("users")
                                          .document ("user")
                                          .setData({
                                        "uid": ("user"),
                                        "email": emailInputController.text,
                                      })
                                          .then((result) =>
                                      {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage(
                                                    )),
                                                (_) => false),
                                        emailInputController.clear(),
                                        pwdInputController.clear(),
                                        confirmPwdInputController.clear()

                                      })
                                          .catchError((err) => print(err)))
                                      .catchError((err) => print(err));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Error"),
                                          content: Text(
                                              "The passwords do not match"),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text("Close"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        );
                                      });
                                }

                              }
                            },
                          ),

                        ]

                    )
                )
            )
        )
    );
  }
}

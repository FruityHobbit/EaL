import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';


@override
Widget build(BuildContext context) {
  return new Scaffold(
      body: new StreamBuilder(
        stream: Firestore.instance.collection('Post New Request').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return new GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,


            children: snapshot.data.documents.map((DocumentSnapshot document) {
              return new ListTile(
                title: new Text(document['case number']),
                subtitle: new Text(document['judge']),
              );

            }).toList(),
          );
        },
      ),
      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.add),
          backgroundColor: new Color(0xFFE57373),
          onPressed: (){
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new UploadFormField()),
            );

          }
      )
  );
}



// UPLOAD TO FIRESTORE



class UploadFormField extends StatefulWidget {
  @override
  _UploadFormFieldState createState() => _UploadFormFieldState();
}

class _UploadFormFieldState extends State<UploadFormField> {
  GlobalKey<FormState> _key = GlobalKey();
  bool _validate = false;
  String caseNumber, judge, firstName, lastName, phoneNum, summary, expect;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Employer a Lawyer'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _key,
              autovalidate: _validate,
              child: FormUI(),

            ),
          ),
        ),
      ),
    );
  }
  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Case Number'),
            validator: validateCaseNumber,
            onSaved: (String val) {
              caseNumber = val;
            }
        ),

        new TextFormField(
            decoration: new InputDecoration(hintText: 'Judge'),
            validator: validateJudge,
            onSaved: (String val) {
              judge = val;
            }
        ),

        new TextFormField(
            decoration: new InputDecoration(hintText: 'First Name'),
            validator: validateFirstName,
            onSaved: (String val){
              firstName = val;
            }
        ),

        new TextFormField(
            decoration: new InputDecoration(hintText: 'Last Name'),
            validator: validateLastName,
            onSaved: (String val){
              lastName = val;
            }
        ),

        new TextFormField(
            decoration: new InputDecoration(hintText: 'Phone Number'),
            validator: validatePhoneNumber,
            onSaved: (String val){
              phoneNum = val;
            }
        ),

        new TextFormField(
            decoration: new InputDecoration(hintText: 'Summary of What Happened Last'),
            validator: validateExpect,
            onSaved: (String val){
              summary = val;
            }
        ),

        new TextFormField(
            decoration: new InputDecoration(hintText: 'What to Expect at Court'),
            validator: validateSummary,
            onSaved: (String val){
              expect = val;
            }
        ),

        new SizedBox(height: 15.0),
        new RaisedButton(onPressed: _sendToServer, child: new Text('Submit'),
        )
      ],
    );
  }
  String validateCaseNumber(String value) {
    String pattern = r'(^[0-9a-zA-z]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Case Number is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Case Number example: 00-XX-00000";
    }
    else if(value.length < 11){
      return "Case Number is too short.";
    }
    else if(value.length > 11){
      return "Case Number is too long.";
    }
    return null;
  }

  String validateJudge(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Judge is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Judge field must have valid name";
    }
    return null;
  }

  String validateFirstName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "First Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "First Name field must have valid name";
    }
    return null;
  }

  String validateLastName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Last Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Last Name field must have valid name";
    }
    return null;
  }

  String validatePhoneNumber(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Phone Number is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Phone Number field must have valid number";
    }
    return null;
  }

  String validateSummary(String value) {
    String pattern = r'(^[0-1]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Summary is Required";
    }
    return null;
  }

  String validateExpect(String value) {
    String pattern = r'(^[0-1]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "What to Expect at Court is Required";
    }
    return null;
  }



  _sendToServer(){
    if (_key.currentState.validate() ){
      //No error in validator
      _key.currentState.save();
      Firestore.instance.runTransaction((Transaction transaction) async {
        CollectionReference reference = Firestore.instance.collection('Post New Request');

        await reference.add({"caseNumber": "$caseNumber", "judge": "$judge", "firstName": "$firstName", "lastName": "$lastName", "phoneNumber": "$phoneNum", "summary": "$summary", "expect": "$expect"});
      });
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }

  }
}
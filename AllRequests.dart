import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';


void main() => runApp(DriverList());

class DriverList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All Requests',
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Requests')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Post New Request').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }


  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {

    final record = Record.fromSnapshot(data);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: ListTile(
            title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(record.lastName,style: TextStyle(color: Colors.black, fontSize: 16.0),),
                Text(record.firstName,style: TextStyle(color: Colors.black, fontSize: 16.0),),
                Text(record.phoneNumber,style: TextStyle(color: Colors.black, fontSize: 16.0),),
                Text(record.caseNumber,style: TextStyle(color: Colors.black, fontSize: 16.0),),
                Text(record.summary,style: TextStyle(color: Colors.black, fontSize: 16.0),),
                Text(record.expect,style: TextStyle(color: Colors.black, fontSize: 16.0),),
              ]
            ),

          ),
        ));
  }
}


class Record {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String caseNumber;
  final String summary;
  final String expect;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['firstName'] != null),
        assert(map['lastName'] != null),
        assert(map['phoneNumber'] != null),
        assert(map['caseNumber'] != null),
        assert(map['summary'] != null),
        assert(map['expect'] != null),
        firstName = map['firstName'],
        lastName = map['lastName'],
        phoneNumber = map['phoneNumber'],
        caseNumber = map['caseNumber'],
        summary = map['summary'],
        expect = map['expect'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$firstName:$lastName:$phoneNumber:$caseNumber:$summary:$expect>";
}
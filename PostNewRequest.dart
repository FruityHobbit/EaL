import 'package:flutter/material.dart';

class PostNewRequest extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return PostNewRequestState();
  }
}

class PostNewRequestState extends State<PostNewRequest>{
  String _caseNumber;
  String _judge;
  String _firstName;
  String _lastName;
  String _phoneNumber;
  String _summary;
  String _expect;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildCaseNumber(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Case Number'),
        validator: (String value){
          if(value.isEmpty){
            return 'Case Number is Required';
          }
        },
        onSaved: (String value){
          _caseNumber = value;
        }
    );
  }

  Widget _buildJudge(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Judge'),
        validator: (String value){
          if(value.isEmpty){
            return 'Judge is Required';
          }
        },
        onSaved: (String value){
          _judge = value;
        }
    );
  }

  Widget _buildFirstName(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Clients First Name'),
        validator: (String value){
          if(value.isEmpty){
            return 'Clients First Name is Required';
          }
        },
        onSaved: (String value){
          _firstName = value;
        }
    );
  }

  Widget _buildLastName(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Clients Last Name'),
        validator: (String value){
          if(value.isEmpty){
            return 'Clients Last Name is Required';
          }
        },
        onSaved: (String value){
          _lastName = value;
        }
    );
  }

  Widget _buildPhoneNumber(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Clients Phone Number'),
        validator: (String value){
          if(value.isEmpty){
            return 'Clients Phone Number is Required';
          }
        },
        onSaved: (String value){
          _phoneNumber = value;
        }
    );
  }

  Widget _buildSummary(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Summary'),
        validator: (String value){
          if(value.isEmpty){
            return 'Summary is Required';
          }
        },
        onSaved: (String value){
          _summary = value;
        }
    );
  }

  Widget _buildExpect(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'What to Expect at Court'),
        validator: (String value){
          if(value.isEmpty){
            return 'What to Expect at Court is Required';
          }
        },
        onSaved: (String value){
          _expect = value;
        }
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: Text("Employer a Lawyer")),
        body: Container(
            margin: EdgeInsets.all(24),
            child: Form(
                key: _formKey,
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildCaseNumber(),
                      _buildJudge(),
                      _buildFirstName(),
                      _buildLastName(),
                      _buildPhoneNumber(),
                      _buildSummary(),
                      _buildExpect(),
                      SizedBox(height: 100),
                      RaisedButton(
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.blue, fontSize: 14,),
                          ),
                          onPressed: () {
                            if(!_formKey.currentState.validate()){
                              return;
                            }

                            _formKey.currentState.save();

                            print(_caseNumber);
                            print(_judge);
                            print(_firstName);
                            print(_lastName);
                            print(_phoneNumber);
                            print(_summary);
                            print(_expect);

                          }
                      ),
                    ]
                )
            )
        )
    );
  }
}

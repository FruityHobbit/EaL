import 'package:flutter/material.dart';
import 'AllRequests.dart';
import 'PostNewRequest.dart';
import 'Account.dart';
import 'settings.dart';
import 'Accepted.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
  ));
}

class _PageState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeState();
  }
}

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class HomeSearch extends StatelessWidget {
  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Post(
        "Title : $search $index",
        "Description :$search $index",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
//          child: SearchBar<Post>(
//            onSearch: search,
  //          onItemFound: (Post post, int index) {
    //          return ListTile(
      //          title: Text(post.title),
        //        subtitle: Text(post.description),
          //    );
            //},
       //   ),
       ),
      ),
    );
  }
}
class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    final title = 'Home Page';


    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.lightBlue,
          title: new Text('Employer a Lawyer'),
        ),
        body: new Container(
            padding: new EdgeInsets.all(22.0),

            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(icon: new Icon(Icons.check_box),
                          color: Colors.lightBlue,
                          iconSize: 200,
                          padding: EdgeInsets.fromLTRB(10, 0, 100, 50),
                          tooltip: "All Requests",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => DriverList(),));
                          },),
                        IconButton(icon: new Icon(Icons.move_to_inbox),
                          color: Colors.lightBlueAccent,
                          iconSize: 200,
                          padding: EdgeInsets.fromLTRB(100, 0, 10, 50),
                          tooltip: "Accepted Requests",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>  Accepted(),));
                          },)
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(icon: new Icon(Icons.add_comment),
                          color: Colors.lightBlue,
                          iconSize: 200,
                          padding: EdgeInsets.fromLTRB(10, 50, 100, 0),
                          tooltip: "Post New Request",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => PostNewRequest(),));
                          },),
                        IconButton(icon: new Icon(Icons.account_box),
                          color: Colors.lightBlueAccent,
                          iconSize: 200,
                          padding: EdgeInsets.fromLTRB(100, 50, 10, 0),
                          tooltip: "Account",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => Account(),));
                          },),

                      ])
                ])));
  }
}
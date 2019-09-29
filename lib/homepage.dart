//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:async/async.dart';

import 'postdetailspage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
/*  StreamSubscription<QuerySnapshot> subscription;

  List<DocumentSnapshot> snapshot;

  CollectionReference collectionReference =
      Firestore.instance.collection("Post");

  @override
  void initState() {
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot = datasnapshot.documents;
      });
    });
    super.initState();
    subscription.cancel();
  }
*/
  passData(DocumentSnapshot snap){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostDetails(snapshot: snap)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iBlog'),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => {},
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => {},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("dummmy"),
              accountEmail: Text("dummy@abc.xom"),
              decoration: BoxDecoration(color: Colors.black),
            ),
            ListTile(
              title: Text('First Page'),
              leading: Icon(Icons.add_circle),
            ),
            ListTile(
              title: Text('Second Page'),
              leading: Icon(Icons.cake),
            ),
            ListTile(
              title: Text('Third Page'),
              leading: Icon(Icons.face),
            ),
            ListTile(
              title: Text('Fourth Page'),
              leading: Icon(Icons.confirmation_number),
            ),
            Divider(
              height: 10.0,
              color: Colors.black,
            ),
            ListTile(
              title: Text('Close'),
              leading: Icon(Icons.close),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('Post').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text("Loading");

          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.green[100],
                elevation: 10.0,
                margin: EdgeInsets.all(10.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          child:
                              Text(snapshot.data.documents[index]["title"][0],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  )),
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.red,
                        ),
                      ),
                      Container(
                        width: 210.0,
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            InkWell(
                              child: Text(
                                snapshot.data.documents[index]["title"],
                                style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                              ),
                              onTap: (){
                                passData(snapshot.data.documents[index]);
                              },
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(snapshot.data.documents[index]["content"],
                                maxLines: 2),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

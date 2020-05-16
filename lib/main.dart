import 'package:apk_http_post/post_module.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Http Post"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildTextResponse(),
            RaisedButton(child: Text("Post"), onPressed: () {
              PostResult.connectToAPI("Badu", "Dokter").then((value){
                postResult = value;
                setState(() {
                  
                });
              });
            })
          ],
        )),
      ),
    );
  }

  Text buildTextResponse() => Text("Hasil Response Http:\n" +
      (postResult == null
          ? ""
          : postResult.id + "|" + postResult.name + "|" + postResult.job),style: TextStyle(fontSize: 30),);
}

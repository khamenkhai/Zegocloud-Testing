import 'package:flutter/material.dart';
import 'package:zego_cloud_testin/call_testing/call_home.dart';
import 'package:zego_cloud_testin/chat/login.dart';
import 'package:zego_cloud_testin/socket_testing.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  // Initialize ZegoCloud SDK with your appID and appSign
  await ZIMKit().init(
    appID: 2052350934, // your appid
    appSign:
        '8a8e27e50440a4e28f5e268b2f8289f5ef5cc6f08edbc99712b3f2b03d3c1c83', // your appSign
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

// First Screen (Main Screen)
class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CupertinoNavigationBar(
      //   middle: Text('ZegoCloud Testing'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
            child: Text("Chat Testing"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebSocketTesting(),
                ),
              );
            },
            child: Text("socket testing"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CallHome(),
                ),
              );
            },
            child: Text("call testing"),
          ),
        ],
      ),
    );
  }
}

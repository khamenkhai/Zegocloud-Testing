import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zego_cloud_testin/call_testing/zego_cloud/zego_cloud_call.dart';

class CallHome extends StatefulWidget {
  const CallHome({super.key});

  @override
  State<CallHome> createState() => _CallHomeState();
}

class _CallHomeState extends State<CallHome> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         
          children: [
            CupertinoTextField(
              controller: textController,
            ),
            SizedBox(height: 10),
            CupertinoButton.filled(
              child: Text("Zego Call"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ZegoCloudCallScreen(
                      callId: textController.text,
                      isVoice: false,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            CupertinoButton.filled(
              child: Text("Agora Call"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Container()
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Second Screen to display the text
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class SecondScreen extends StatefulWidget {
  final String text;

  SecondScreen({required this.text});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int ramdomName = Random().nextInt(9999);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          ZegoUIKitPrebuiltCall(
            events: ZegoUIKitPrebuiltCallEvents(),

            appID:
                000, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
            appSign:
                "you app sign kehy", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
            userID: ramdomName.toString(),
            userName: "User name : ${ramdomName}",
            callID: "${widget.text}",
            // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
            config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()

          /// support minimizing
          // ..topMenuBar.isVisible = true
          // ..topMenuBar.buttons = [
          //   ZegoCallMenuBarButtonName.minimizingButton,
          //   ZegoCallMenuBarButtonName.showMemberListButton,
          //   ZegoCallMenuBarButtonName.soundEffectButton,
          // ]
          // ..avatarBuilder = (context,size,user,mapData){
          //   return Text("hello world");
          // },
            // ..onOnlySelfInRoom = () => Navigator.of(context).pop(),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 50),
            child: Text(
              "Call ID : ${widget.text}",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}



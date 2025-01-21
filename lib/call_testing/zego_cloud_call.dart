// Second Screen to display the text
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class ZegoCloudCalllScreen extends StatefulWidget {
  final String callId;
  final bool isVoice;

  ZegoCloudCalllScreen({required this.callId,required this.isVoice});

  @override
  State<ZegoCloudCalllScreen> createState() => _ZegoCloudCalllScreenState();
}

class _ZegoCloudCalllScreenState extends State<ZegoCloudCalllScreen> {
  int ramdomName = Random().nextInt(9999);

  int appId = 2294897;
  String appSign =
      "ede4f0ddedc5baeddec523de332fb01ccc0fd3555a5ea94bba110154fe01653c";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ZegoUIKitPrebuiltCall(
            events: ZegoUIKitPrebuiltCallEvents(
                // room: ZegoCallRoomEvents(),
                // audioVideo: ZegoCallAudioVideoEvents(),
                // onCallEnd: (event, defaultAction) {},
                // onError: (p0) {},
                // onHangUpConfirmation: (event, defaultAction) {},
                // user: ZegoCallUserEvents(
                //   onEnter: (p0) {},
                //   onLeave: (p0) {},
                // ),

                ),
            appID: appId,
            appSign: appSign,
            userID: ramdomName.toString(),
            userName: "User name : ${ramdomName}",
            callID: "${widget.callId}",
            config:widget.isVoice ? ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall() : ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()

              //support minimizing
              ..topMenuBar.isVisible = true
              ..topMenuBar.buttons = [
                ZegoCallMenuBarButtonName.minimizingButton,
                ZegoCallMenuBarButtonName.showMemberListButton,
                ZegoCallMenuBarButtonName.soundEffectButton,
              ]
          ),
        ],
      ),
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:zego_cloud_testin/const/zego_config.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class ZegoCloudCallScreen extends StatefulWidget {
  final String callId;
  final bool isVoice;

  ZegoCloudCallScreen({required this.callId, required this.isVoice});

  @override
  State<ZegoCloudCallScreen> createState() => _ZegoCloudCallScreenState();
}

class _ZegoCloudCallScreenState extends State<ZegoCloudCallScreen>
    with WidgetsBindingObserver {
  late int randomName;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    randomName = Random().nextInt(9999);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // App moved to background
      print("App is in background. Ensure audio continues.");
    } else if (state == AppLifecycleState.resumed) {
      // App returned to foreground
      print("App is in foreground.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZegoUIKitPrebuiltCall(
        appID: ZegoConfig.appId,
        appSign: ZegoConfig.appSign,
        userID: randomName.toString(),
        userName: "User name: $randomName",
        callID: widget.callId,
        config: widget.isVoice
            ? ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()
            : ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..topMenuBar.isVisible = true
          ..topMenuBar.buttons = [
            ZegoMenuBarButtonName.minimizingButton,
            ZegoMenuBarButtonName.showMemberListButton,
            ZegoMenuBarButtonName.soundEffectButton,
          ],
        events: ZegoUIKitPrebuiltCallEvents(
            // onCallEnd: (callID) {
            //   Navigator.pop(context);
            // },
            // onError: (code, message) {
            //   print("Error: $code - $message");
            // },
            ),
      ),
    );
  }
}

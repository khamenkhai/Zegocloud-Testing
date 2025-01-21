// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';

// class CallPage extends StatefulWidget {
//   @override
//   _CallPageState createState() => _CallPageState();
// }

// class _CallPageState extends State<CallPage> with WidgetsBindingObserver {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     _initializeAgora();
//   }

//   void _initializeAgora() async {
//     await AgoraRtcEngine.create('yourAppId');
//     await AgoraRtcEngine.enableAudio();
//     await AgoraRtcEngine.joinChannel('token', 'channelName', null, 0);
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.paused) {
//       AgoraRtcEngine.setEnableBackgroundAudio(true);
//     } else if (state == AppLifecycleState.resumed) {
//       AgoraRtcEngine.setEnableBackgroundAudio(false);
//     }
//   }

//   @override
//   void dispose() {
//     AgoraRtcEngine.leaveChannel();
//     AgoraRtcEngine.destroy();
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text("Agora Call")),
//     );
//   }
// }

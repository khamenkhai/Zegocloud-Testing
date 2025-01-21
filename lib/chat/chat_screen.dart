// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:zego_cloud_testin/chat/home_popup.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [
          HomePagePopup(),
        ],
      ),
      body: ZIMKitConversationListView(
        
        onPressed: (context, conversation, defaultAction) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ZIMKitMessageListPage(
                  
                  // pickMediaButtonWidget: Icon(Icons.image),
                  // showRecordButton: false,
                  // showMoreButton: false,
                  // showPickFileButton: false,
                  // showPickMediaButton: false,
                  // sendButtonWidget: Icon(Icons.send),
                  messageItemBuilder: (context, message, defaultWidget) {
                    print("message : ${message.info.senderUserID}");
                    return defaultWidget;
                  },
                  
                  // appBarBuilder: (context, defaultAppBar) {
                  //   return AppBar(
                  //     title: Text("hello world"),
                  //   );
                  // },
                  appBarActions: [
                    Icon(Icons.abc),
                  ],


                  conversationID: conversation.id,
                  conversationType: conversation.type,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

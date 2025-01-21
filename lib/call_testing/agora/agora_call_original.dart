// ignore_for_file: unused_element

import 'dart:math';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AgoraVidoCall extends StatefulWidget {
  final String callId;
  final String appId;
  final bool isVoice;

  AgoraVidoCall({
    required this.callId,
    required this.isVoice,
    required this.appId,
  });

  @override
  State<AgoraVidoCall> createState() => _AgoraVidoCallState();
}

class _AgoraVidoCallState extends State<AgoraVidoCall> {
  int randomName = Random().nextInt(9999);

  final primaryColor = Color(0xffE77917);

  AgoraClient? client;
  String baseUrl = 'https://whatsapp-clone-rrr.herokuapp.com';
  bool speakerHigh = true;
  bool isMuted = false;
  bool isVideoOff = false;

  bool isFrontCamera = true;

  @override
  void initState() {
    super.initState();
    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: widget.appId,
        channelName: widget.callId,
        tokenUrl: baseUrl,
      ),
    );
    initAgora();
  }

  void initAgora() async {
    await client!.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: client == null
          ? const CupertinoActivityIndicator()
          : Stack(
            children: [
              // Remote video view
              AgoraVideoViewer(
                client: client!,
                disabledVideoWidget: Text("Helloworld"),
                enableHostControls: true,
                // showNumberOfUsers: true,
                // layoutType: Layout.floating,
              ),
          
              
          
              // Miniature local video view
              // Positioned(
              //   top: 20,
              //   right: 20,
              //   child: Container(
              //     width: 100,
              //     height: 150,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(16),
              //       border: Border.all(color: Colors.white, width: 2),
              //     ),
              //     child: ClipRRect(
              //       borderRadius: BorderRadius.circular(16),
              //       child: AgoraVideoViewer(
              //         client: client!,
              //         layoutType: Layout.grid,
          
              //       ),
              //     ),
              //   ),
              // ),
          
              // Audio status icon (e.g., mute/unmute)
              Positioned(
                top: 35,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCustomButton(
                      size: 40,
                      icon: PhosphorIcons.arrowsInSimple(),
                      isActive: false,
                      onPressed: ()async {
                           if (client != null) {
                          setState(() {
                            isFrontCamera = !isFrontCamera;
                          });
                          await client!.engine.switchCamera();
                          print(
                              "Camera is now ${isFrontCamera ? 'Front' : 'Rear'}");
                        } else {
                          print("Agora client or engine is not initialized");
                        }
                      },
                    ),
                    // User info and call duration
              Column(
                children: [
                  Text(
                    "Mg Win",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(height: 4),
                  Text(
                    "00:01",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
                    _buildCustomButton(
                      size: 40,
                      icon: PhosphorIcons.cameraRotate(),
                      isActive: false,
                      onPressed: ()async {
                           if (client != null) {
                          setState(() {
                            isFrontCamera = !isFrontCamera;
                          });
                          await client!.engine.switchCamera();
                          print(
                              "Camera is now ${isFrontCamera ? 'Front' : 'Rear'}");
                        } else {
                          print("Agora client or engine is not initialized");
                        }
                      },
                    ),
                  ],
                ),
              ),
          
              Positioned(
                bottom: 75,
                left: 0,
                right: 0,
                child: AgoraVideoButtons(
                  client: client!,
                ),
              ),
          
              // Custom buttons at the bottom
              _buttonRows(context),
            ],
          ),
    );
  }

  Positioned _buttonRows(BuildContext context) {
    return Positioned(
      bottom: 50,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Volume button
          _buildCustomButton(
            icon: PhosphorIcons.speakerHigh(),
            isActive: speakerHigh,
            onPressed: () {
              setState(() {
                speakerHigh = !speakerHigh;
                client!.engine.setEnableSpeakerphone(speakerHigh);
              });
            },
          ),
          // Video button
          _buildCustomButton(
            isActive: isVideoOff,
            icon: PhosphorIcons.videoCamera(),
            onPressed: () async {
              if (client != null) {
                isVideoOff = !isVideoOff; // Toggle state

                await client!.engine.muteLocalVideoStream(isVideoOff);

                await client!.engine.enableVideo();
                setState(() {});
                // client!.engine.stopDumpVideo();

                print("Camera is now ${isVideoOff ? 'OFF' : 'ON'}");
              } else {
                print("Agora client or engine is not initialized");
              }
              setState(() {});
            },
          ),
          // Call end button
          GestureDetector(
            onTap: () async {
              await client!.engine.leaveChannel();
              Navigator.pop(context);
            },
            child: Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: primaryColor),
              ),
              child: PhosphorIcon(
                PhosphorIcons.phone(),
                color: Colors.white,
                size: 28,
              ),
            ),
          ),

          // Mic button
          _buildCustomButton(
            isActive: isMuted,
            icon: PhosphorIcons.microphone(),
            onPressed: () {
              setState(() {
                isMuted = !isMuted;
                client!.engine.muteLocalAudioStream(isMuted);
              });
            },
          ),
          // More button
          _buildCustomButton(
            isActive: false,
            icon: PhosphorIcons.dotsThreeOutlineVertical(),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 200,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: Text("Settings"),
                          onTap: () {
                            Navigator.pop(context);
                            // Implement settings logic here
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.share),
                          title: Text("Share Screen"),
                          onTap: () {
                            Navigator.pop(context);
                            // Implement screen sharing logic here
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCustomButton({
    required IconData icon,
    Color? color,
    required VoidCallback onPressed,
    required bool isActive,
    double size = 58,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.05),
          shape: BoxShape.circle,
          border: Border.all(
              width: 2, color: isActive ? primaryColor : Colors.transparent),
        ),
        child: PhosphorIcon(
          icon,
          color: primaryColor,
          size: 28,
        ),
      ),
    );
  }

  // old form
  SafeArea _oldForm() {
    return SafeArea(
      child: Stack(
        children: [
          AgoraVideoViewer(client: client!),
          AgoraVideoButtons(
            client: client!,
          ),
        ],
      ),
    );
  }
}

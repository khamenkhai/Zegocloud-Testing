import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketTesting extends StatefulWidget {
  const WebSocketTesting({super.key});

  @override
  State<WebSocketTesting> createState() => _WebSocketTestingState();
}

class _WebSocketTestingState extends State<WebSocketTesting> {
  final channel = WebSocketChannel.connect(
    Uri.parse("wss://ws.bitmex.com/realtime?subscribe=instrument,orderBookL2_25:XBTUSD"), // Replace with your WebSocket URL
  );

  @override
  void initState() {
    //_streamListener();
    super.initState();
  }

  _streamListener() {

    channel.stream.listen((message) {
    channel.sink.add('received!');
    channel.sink.close(message);
  });

    // channel.stream.listen(
    //   (event) {
    //     try {
    //       Map data = jsonDecode(event);
    //       print("WebSocket data: $data");
    //     } catch (e) {
    //       print("Error decoding WebSocket data: $e");
    //     }
    //   },
    //   onError: (error) {
    //     print("WebSocket error: $error");
    //   },
    //   onDone: () {
    //     print("WebSocket connection closed");
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebSocket Testing"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            _streamListener();
          }, child: Text("Testing")),

          StreamBuilder(
            stream: channel.stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return Text("Data: ${snapshot.data}");
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return Text("No data");
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}

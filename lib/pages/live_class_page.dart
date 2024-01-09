// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class VideoCall extends StatefulWidget {
//   String channelName = "test";
//
//   VideoCall({required this.channelName});
//   @override
//   _VideoCallState createState() => _VideoCallState();
// }
//
// class _VideoCallState extends State<VideoCall> {
//   late final AgoraClient _client;
//   bool _loading = true;
//   String tempToken = "";
//
//   @override
//   void initState() {
//     getToken();
//     super.initState();
//   }
//
//   Future<void> getToken() async {
//     String link =
//         "https://agora-node-tokenserver--utshakarmakar04.repl.co/access_token?channelName=${widget.channelName}";
//
//     Response _response = await get(Uri.parse(link));
//     Map data = jsonDecode(_response.body);
//     setState(() {
//       tempToken = data["token"];
//     });
//     _client = AgoraClient(
//         agoraConnectionData: AgoraConnectionData(
//           appId: "09ac3807ca6f4f19b52c8a6488ddd5d0",
//           tempToken:tempToken,
//           channelName: widget.channelName,
//         ),
//         enabledPermission: [Permission.camera, Permission.microphone]);
//     Future.delayed(Duration(seconds: 1)).then(
//           (value) => setState(() => _loading = false),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: _loading
//             ? Center(
//           child: CircularProgressIndicator(),
//         )
//             : Stack(
//           children: [
//             AgoraVideoViewer(
//               client: _client,
//             ),
//             AgoraVideoButtons(client: _client)
//           ],
//         ),
//       ),
//     );
//     ;
//   }
// }
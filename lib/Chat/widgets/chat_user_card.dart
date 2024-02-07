import 'package:austudy_01/Chat/models/chat_user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUser user;
  const ChatUserCard({super.key, required this.user});

  @override
  State<ChatUserCard> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ChatUserCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: mq.width* .04, vertical: 4),
      elevation: 0.5,
      child: InkWell(
        onTap: (){},
        child:  ListTile(
          //leading: const CircleAvatar(child: Icon(CupertinoIcons.person)),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(mq.height* .3),
            child: CachedNetworkImage(
              width: mq.height* .055,
              height: mq.height* .055,
              imageUrl: widget.user.image,
              errorWidget: (context, url, error) => const CircleAvatar(child: Icon(CupertinoIcons.person)),
            ),
          ),
          title: Text(widget.user.name),
          subtitle: Text(widget.user.about, maxLines: 1),
          trailing: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.greenAccent.shade400,
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ),
      )
    );
  }
}

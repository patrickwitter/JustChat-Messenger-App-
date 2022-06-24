import 'package:flutter/material.dart';
import 'package:messengerapp/viewmodel/chatlist_tile_viewmodel.dart';
import 'package:messengerapp/views/baseviewinit.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

class ChatRoomListTile extends StatelessWidget {
  const ChatRoomListTile(
      {required this.lastMessage,
      required this.chatRoomId,
      required this.myUsername,
      Key? key})
      : super(key: key);

  final String lastMessage, chatRoomId, myUsername;
  @override
  Widget build(BuildContext context) {
    return BaseViewInit<ChatListTileViewModel>(
      onModelReady: (model) => model.initialize(chatRoomId, myUsername),
      builder: ((context, model) {
        print(" Profile pic ${model.profilePicUrl}");
        return InkWell(
          splashColor: Colors.blue,
          onTap: () {
            model.loadChatScreen(chatRoomId);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: OptimizedCacheImage(
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    imageUrl:
                        "https://static.toiimg.com/thumb/msid-86086241,imgsize-38908,width-400,resizemode-4/86086241.jpg",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.otherusername,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 3),
                    Text(lastMessage)
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

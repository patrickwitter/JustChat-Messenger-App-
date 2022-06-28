import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messengerapp/viewmodel/chatlist_tile_viewmodel.dart';
import 'package:messengerapp/views/baseviewinit.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';
import 'package:sizer/sizer.dart';

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
        return InkWell(
          splashColor: Colors.blue,
          onTap: () {
            model.loadChatScreen(chatRoomId);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffe8e8e8).withOpacity(.5),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.symmetric(vertical: 1.h),
            padding: EdgeInsets.all(3.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: CircleAvatar(
                    radius: 10.w,
                    backgroundImage: const AssetImage(
                      "assets/default-profile.jpg",
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.otherusername,
                        style: GoogleFonts.lato(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 3),
                      Text(lastMessage)
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_vendor/constants/colors.dart';
import 'package:eventually_vendor/constants/font.dart';
import 'package:eventually_vendor/controller/firebaseController.dart';
import 'package:eventually_vendor/controller/message_controller.dart';
import 'package:eventually_vendor/controller/offer_btn_controller.dart';
import 'package:eventually_vendor/firebaseMethods/addService.dart';
import 'package:eventually_vendor/models/message_model.dart';
import 'package:eventually_vendor/screens/chat/chat_screen.dart';
import 'package:flutter/cupertino.dart.';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../models/chat_user.dart';
import 'widgets/chat_user_card.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  final _msgController = Get.put(MessageController());
  final btnController = Get.put(ButtonController());

  String chatroomId(String vendor, String user) {
    if (vendor.hashCode <= user.hashCode) {
      return "$vendor$user";
    } else {
      return '$user$vendor';
    }
  }

  final firebasecontroller = Get.put(firebaseController());
  //!for storing All users
  final List<ChatUser> _list = [];
  //!for storing searched items
  final List<ChatUser> _searchlist = [];
  //!for storing search status
  bool _isSearching = false;
  // final List<String> chatUserId = [];

  @override
  Widget build(BuildContext context) {
    print('length');
    print(_msgController.chatUserId.length);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        //!if Search is on then back button simply close the search !the whole app
        onWillPop: () {
          if (_isSearching) {
            setState(() {
              _isSearching = !_isSearching;
            });
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: LiquidPullToRefresh(
          color: AppColors.pink,
          height: 200,
          backgroundColor: AppColors.appBar,
          onRefresh: () async {
            _msgController.chatUserId.clear();
            // getResult();
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: _isSearching
                  ? TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Name, Email, ...',
                      ),
                      autofocus: true,
                      //?When Search text changes then update searchlist
                      onChanged: (value) {
                        //?Search Logic
                        _searchlist.clear();
                        for (var i in _list) {
                          if (i.name
                                  .toLowerCase()
                                  .contains(value.toLowerCase()) ||
                              i.email
                                  .toLowerCase()
                                  .contains(value.toLowerCase())) {
                            _searchlist.add(i);
                          }
                          setState(() {
                            _searchlist;
                          });
                        }
                      },
                      style: const TextStyle(fontSize: 17, letterSpacing: 0.5),
                    )
                  : Container(),
              actions: [
                //Search User button
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isSearching = !_isSearching;
                      print('jk');
                      print(_list.length);
                    });
                  },
                  icon: Icon(
                    _isSearching
                        ? CupertinoIcons.clear_circled_solid
                        : Icons.search,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('messages')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _msgController.chatUserId.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: _isSearching
                                  ? _searchlist.length
                                  : _msgController.chatUserId.length,
                              itemBuilder: (context, index) {
                                return StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('User')
                                        .doc(_msgController.chatUserId[index])
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        
                                        _list.add(ChatUser(
                                            name: snapshot.data!['name'],
                                            about: snapshot.data!['email'],
                                            lastActive:
                                                snapshot.data!['lastActive'],
                                            id: snapshot.data!['userId'],
                                            email: snapshot.data!['email']));
                                        return GestureDetector(
                                          onTap: () {
                                            _msgController.userName.value =
                                                 snapshot.data!['name'];
                                            _msgController.userId.value =
                                                snapshot.data!['userId'];
                                            String userId =
                                                auth.currentUser!.uid;
                                            _msgController.chatRoomId.value =
                                                chatroomId(userId,
                                                    snapshot.data!['userId']);
                                            Get.to(
                                              () => ChatScreen(
                                                user: ChatUser(
                                                    name:
                                                        snapshot.data!['name'],
                                                    about:
                                                        snapshot.data!['email'],
                                                    lastActive: snapshot
                                                        .data!['lastActive'],
                                                    id: snapshot
                                                        .data!['userId'],
                                                    email: snapshot
                                                        .data!['email']),
                                              ),
                                            );
                                          },
                                          child: ChatUserCard(
                                              user: _isSearching
                                                  ? _searchlist[index]
                                                  : _list[index]),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    });
                              })
                          : Center(
                              child: Text(
                              'No Chats to Display',
                              style: TextStyle(
                                fontSize: Get.width * 0.04,
                                fontFamily: AppFonts.manrope,
                                color: AppColors.grey,
                              ),
                            ));
                    } else {
                      return const Center(
                          child: SpinKitFadingCircle(
                        color: AppColors.pink,
                      ));
                    }
                  }),
            ),
          ),
        ),
      ),
    );
  }
}












// TextButton(
//                     child: Text(
//                       'hello',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (_) => ButtonWithBottomContainer()),
//                       );
//                     },),),
          
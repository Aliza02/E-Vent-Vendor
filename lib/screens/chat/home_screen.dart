import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_vendor/constants/colors.dart';
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
              leading: IconButton(
                icon: Icon(
                  CupertinoIcons.back,
                  color: AppColors.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
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
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: _isSearching
                              ? _searchlist.length
                              : _msgController.chatUserId.length,
                          itemBuilder: (context, index) {
                            print(_msgController.chatUserId.length);
                            // List<String> currentUserChat = [];
                            // DocumentSnapshot document = snapshot.data!.docs[index];
                            // print('id ' + document.id);
                            // if (document.id.contains(auth.currentUser!.uid)) {
                            //   // currentUserChat.add(document.id);
                            //   List<String> parts =
                            //       document.id.split(auth.currentUser!.uid);
                            //   print(parts.length);
                            //   if (parts[0].contains(auth.currentUser!.uid)) {
                            //     print('if');
                            //     currentUserChat.add(parts[1]);
                            //     print(parts[1]);
                            //   } else {
                            return StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('User')
                                    .doc(_msgController.chatUserId[index])
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    print('has data');

                                    print(snapshot.data!.data());

                                    print(snapshot.data!['name']);
                                    _list.add(ChatUser(
                                        name: snapshot.data!['name'],
                                        about: snapshot.data!['email'],
                                        lastActive:
                                            snapshot.data!['lastActive'],
                                        id: 'weqe',
                                        isOnline: false,
                                        pushToken: "oo",
                                        email: snapshot.data!['email']));
                                    return GestureDetector(
                                      onTap: () {
                                        _msgController.userName.value =
                                            snapshot.data!['name'];
                                        _msgController.userId.value =
                                            snapshot.data!['userId'];
                                        String userId = auth.currentUser!.uid;

                                        _msgController.chatRoomId.value =
                                            chatroomId(userId,
                                                snapshot.data!['userId']);

                                        print(_msgController.list.length);

                                        Get.to(
                                          () => ChatScreen(
                                            user: ChatUser(
                                                name: snapshot.data!['name'],
                                                about: snapshot.data!['email'],
                                                lastActive: snapshot
                                                    .data!['lastActive'],
                                                id: 'sas',
                                                isOnline: false,
                                                pushToken: "oo",
                                                email: snapshot.data!['email']),
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

                            // List<String> ids = [doc['userId']];
                            // print(document['hasChat']);
                            // String abc = '';

                            // print(abc);

                            // FirebaseFirestore.instance
                            //     .collection('messages')
                            //     .doc(chatroomId.toString())
                            //     .get();
                            // _msgController.userName.value = document['name'];
                            // _msgController.userId.value = document['userId'];
                            // print(_msgController.userName.value);
                            // print(_msgController.userId.value);

                            // _list.add(ChatUser(
                            //     name: document['name'],
                            //     about: document['email'],
                            //     lastActive: "1685782402018",
                            //     id: document['userId'],
                            //     isOnline: false,
                            //     pushToken: "oo",
                            //     email: document['email']));

                            // return GestureDetector(
                            //   onTap: () async {
                            //     // _msgController.list.clear();
                            //     // String userId = auth.currentUser!.uid;

                            //     // _msgController.chatRoomId.value =
                            //     //     chatroomId(userId, document['userId']);

                            //     // print(_msgController.list.length);

                            //     // Get.to(
                            //     //   () => ChatScreen(
                            //     //     user: ChatUser(
                            //     //         name: document['name'],
                            //     //         about: document['email'],
                            //     //         lastActive: "1685782402018",
                            //     //         id: document['userId'],
                            //     //         isOnline: false,
                            //     //         pushToken: "oo",
                            //     //         email: document['email']),
                            //     //   ),
                            //     // );
                            //   },
                            //   child: Text('abc'),
                            //   // child: ChatUserCard(
                            //   //     user: _isSearching
                            //   //         ? _searchlist[index]
                            //   //         : _list[index]),
                            // );
                          });
                    } else {
                      return const Center(
                          child: SpinKitFadingCircle(
                        color: AppColors.pink,
                      ));
                    }
                  }),

              // child: (_list.isNotEmpty)
              //     ? ListView.builder(
              //         // itemCount: _isSearching ? _searchlist.length : _list.length,
              //         itemCount: _isSearching ? _searchlist.length : _list.length,
              //         padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
              //         physics: const BouncingScrollPhysics(),
              //         itemBuilder: (context, index) {
              //           return ChatUserCard(
              //               user:
              //                   _isSearching ? _searchlist[index] : _list[index]);
              //         },
              //       )
              //     : const Center(
              //         child: Text(
              //           'No Connections found.',
              //           style: TextStyle(fontSize: 20),
              //         ),
              //       ),
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
          
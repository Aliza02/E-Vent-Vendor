import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_vendor/constants/colors.dart';
import 'package:eventually_vendor/controller/firebaseController.dart';
import 'package:eventually_vendor/controller/message_controller.dart';
import 'package:eventually_vendor/firebaseMethods/addService.dart';
import 'package:eventually_vendor/models/message_model.dart';
import 'package:eventually_vendor/screens/chat/chat_screen.dart';
import 'package:flutter/cupertino.dart.';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/chat_user.dart';
import 'widgets/chat_user_card.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  final _msgController = Get.put(MessageController());
  String chatroomId(String vendor, String user) {
    if (vendor.hashCode <= user.hashCode) {
      return "$vendor$user";
    } else {
      return '$user$vendor';
    }
  }

  final firebasecontroller = Get.put(firebaseController());
  //!for storing All users
  final List<ChatUser> _list = [
    // ChatUser(
    //   name: "John",
    //   about: "Hello, I'm John!",
    //   lastActive: "1685782402018",
    //   id: "1",
    //   isOnline: true,
    //   pushToken: "ABC123",
    //   email: "john@example.com",
    // ),
  ];
  //!for storing searched items
  final List<ChatUser> _searchlist = [];
  //!for storing search status
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
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
                  .collection('User')
                  .where('hasChat',
                      isEqualTo: firebasecontroller.businessName.value)
                  .snapshots(),
              builder: (context, snapshot) {
                print('sda');
                if (snapshot.hasData) {
                  print(snapshot.data!.docs.length);
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot document = snapshot.data!.docs[index];

                        // List<String> ids = [doc['userId']];
                        // print(document['hasChat']);
                        // String abc = '';

                        // print(abc);

                        // FirebaseFirestore.instance
                        //     .collection('messages')
                        //     .doc(chatroomId.toString())
                        //     .get();
                        _msgController.userName.value = document['name'];
                        _msgController.userId.value = document['userId'];
                        _list.addAll(
                          [
                            ChatUser(
                                name: document['name'],
                                about: document['email'],
                                lastActive: "1685782402018",
                                id: document['userId'],
                                isOnline: false,
                                pushToken: "oo",
                                email: document['email'])
                          ],
                        );

                        return GestureDetector(
                          onTap: () async {
                            String userId = auth.currentUser!.uid;
                            String roomId =
                                chatroomId(userId, document['userId']);
                            print("roomid");
                            print(roomId);
                            // await FirebaseFirestore.instance
                            //     .collection('messages')
                            //     .doc(roomId)
                            //     .collection('chat')
                            //     .get()
                            //     .then((value) {
                            //   value.docs.forEach((element) {
                            //     print(element['sendby']);
                            //     // _msgController.userId.value = element['sendby'];
                            //     _msgController.list.add(
                            //       MessageModel(
                            //           msg: element['msg'],
                            //           toID: '121212',
                            //           read: '121',
                            //           type: MsgType.text,
                            //           fromID: '12121',
                            //           sent: '1212'),
                            //     );

                            //     print(roomId);
                            //   });
                            // });
                            Get.to(
                                () => ChatScreen(
                                      user: ChatUser(
                                          name: document['name'],
                                          about: document['email'],
                                          lastActive: "1685782402018",
                                          id: document['userId'],
                                          isOnline: false,
                                          pushToken: "oo",
                                          email: document['email']),
                                    ),
                                arguments: [roomId]);
                          },
                          child: ChatUserCard(
                              user: _isSearching
                                  ? _searchlist[index]
                                  : _list[index]),
                        );
                      });
                } else {
                  return Center(
                    child: Text(
                      'No Chats found.',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }
              },
            ),
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
          
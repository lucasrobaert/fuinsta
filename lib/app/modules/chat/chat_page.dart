import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fuinsta/app/shared/loading_widget.dart';

import 'chat_store.dart';

class ChatPage extends StatefulWidget {
  final String title;
  const ChatPage({Key? key, this.title = 'ChatPage'}) : super(key: key);
  @override
  ChatPageState createState() => ChatPageState();
}
class ChatPageState extends ModularState<ChatPage, ChatStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add_comment_rounded),
            onPressed: () {
              showModalBottomSheet(context: context, builder: (context) {
                return Container(

                );
              });
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: store.chats,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return Text('Deu erro!');
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return LoadingWidget();
          }
          if(snapshot.hasData && snapshot.data!.docs.length > 0){
            final chats = snapshot.data!.docs;

            return ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index){
                final chat = chats[index];
                return Column(
                  children: [
                    FutureBuilder(
                      future: store.getUser(chat['idFrom']),
                      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if(snapshot.hasData){
                          final user = snapshot.data!.data() as Map<String, dynamic>;
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(user['profilePicture']),
                                ),
                                Text(user['diplayName'])
                              ],
                            ),
                          );
                        }
                        return LinearProgressIndicator();
                      },
                    )
                  ],
                );
              },
            );
          }
          return LoadingWidget();
        },
      )
    );
  }
}
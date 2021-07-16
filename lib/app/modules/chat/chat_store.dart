import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStoreBase with _$ChatStore;
abstract class _ChatStoreBase with Store {

  FirebaseAuth firebaseAuth;
  FirebaseFirestore firebaseFirestore;

  _ChatStoreBase({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  }){
    firebaseAuth.userChanges().listen(_onUserChange);
    _loadChat();
  }


  @observable
  late User? user = firebaseAuth.currentUser;

  @observable
  Stream<QuerySnapshot> chats = Stream.empty();





  @action
  void _onUserChange(User? user) {
    this.user = user;
    if (user != null) {
      firebaseFirestore.doc('user/${user.uid}').snapshots()
          .listen(_listenUser);
    }
  }

  @action
  void _listenUser(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.exists) {
      final data = snapshot.data() ?? {};
    }
  }

  @action
  Future<void> _loadChat() async {
    chats = await firebaseFirestore.collection('chats/${firebaseAuth.currentUser!.uid}').snapshots();
  }


  Future<DocumentSnapshot> getUser(String userId) {
    return firebaseFirestore.doc('user/$userId').get();
  }
}
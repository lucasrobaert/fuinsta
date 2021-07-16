// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatStore on _ChatStoreBase, Store {
  final _$userAtom = Atom(name: '_ChatStoreBase.user');

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$chatsAtom = Atom(name: '_ChatStoreBase.chats');

  @override
  Stream<QuerySnapshot<Object?>> get chats {
    _$chatsAtom.reportRead();
    return super.chats;
  }

  @override
  set chats(Stream<QuerySnapshot<Object?>> value) {
    _$chatsAtom.reportWrite(value, super.chats, () {
      super.chats = value;
    });
  }

  final _$_loadChatAsyncAction = AsyncAction('_ChatStoreBase._loadChat');

  @override
  Future<void> _loadChat() {
    return _$_loadChatAsyncAction.run(() => super._loadChat());
  }

  final _$_ChatStoreBaseActionController =
      ActionController(name: '_ChatStoreBase');

  @override
  void _onUserChange(User? user) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase._onUserChange');
    try {
      return super._onUserChange(user);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _listenUser(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase._listenUser');
    try {
      return super._listenUser(snapshot);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
chats: ${chats}
    ''';
  }
}

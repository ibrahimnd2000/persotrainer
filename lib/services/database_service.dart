import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:persotrainer/models/chat.dart';
import 'package:persotrainer/models/chatRoom.dart';
import 'package:persotrainer/models/meeting_model.dart';
import 'package:persotrainer/models/post.dart';
import 'package:persotrainer/models/user.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore;

  DatabaseService(this._firebaseFirestore);

  Future<void> addUser(Map<String, dynamic> data) async {
    return await _firebaseFirestore
        .collection('users')
        .doc(data['emailId'])
        .set(data)
        .catchError((e) {
      print(e.toString());
    });
  }

  Stream<List<Post>> getPosts() {
    Stream<QuerySnapshot> stream =
        _firebaseFirestore.collection('posts').snapshots();

    return stream.map(
        (qShot) => qShot.docs.map((doc) => Post.fromMap(doc.data())).toList());
  }

  Stream<List<ChatRoom>> getChatRoom(String myName) {
    Stream<QuerySnapshot> stream = _firebaseFirestore
        .collection('inbox')
        .where('users', arrayContains: myName)
        .snapshots();

    return stream.map((qShot) =>
        qShot.docs.map((doc) => ChatRoom.fromJson(doc.data())).toList());
  }

  Stream<List<Chat>> getMessages(String chatRoomId) {
    Stream<QuerySnapshot> stream = _firebaseFirestore
        .collection('inbox')
        .doc(chatRoomId)
        .collection('chats')
        .orderBy('timestamp', descending: true)
        .snapshots();

    return stream.map(
        (qShot) => qShot.docs.map((doc) => Chat.fromJson(doc.data())).toList());
  }

  Stream<List<Meeting>> getSchedules(String email) {
    Stream<QuerySnapshot> stream = _firebaseFirestore
        .collection('users')
        .doc(email)
        .collection('schedules')
        .snapshots();

    return stream.map((qShot) =>
        qShot.docs.map((doc) => Meeting.fromJson(doc.data())).toList());
  }

  Stream<Chat> getRecentMessage(String chatRoomId, String target) {
    Stream<QuerySnapshot> stream = _firebaseFirestore
        .collection('inbox')
        .doc(chatRoomId)
        .collection('chats')
        .where('sendBy', isEqualTo: target)
        .snapshots();
    return stream.map(
        (qShot) => Chat.fromJson(qShot.docs[qShot.docs.length - 1].data()));
  }

  Future<void> addMessage(String chatRoomId, Chat chat) async {
    return await _firebaseFirestore
        .collection('inbox')
        .doc(chatRoomId)
        .collection('chats')
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(chat.toJson())
        .catchError((e) {
      print(e);
    });
  }

  Future<void> addSchedule(String email, Meeting meeting) async {
    return await _firebaseFirestore
        .collection('users')
        .doc(email)
        .collection('schedules')
        .doc(meeting.eventName)
        .set(meeting.toJson())
        .catchError((e) {
      print(e);
    });
  }

  Future<User> loadUser(String emailId) async {
    DocumentSnapshot result =
        await _firebaseFirestore.collection('users').doc(emailId).get();
    if (result.exists) return User.fromSnapshot(result.data());
    return null;
  }

  Future<void> addPost(Post post) async {
    return await _firebaseFirestore
        .collection('posts')
        .doc()
        .set(post.toJson())
        .catchError((e) {
      print(e);
    });
  }

  Future<void> addChatRoom(String docId, Map<String, dynamic> data) async {
    return await _firebaseFirestore
        .collection('inbox')
        .doc(docId)
        .set(data)
        .catchError((e) {
      print(e);
    });
  }

  Future<bool> doesEmailExists(String emailId) async {
    try {
      final result =
          await _firebaseFirestore.collection('users').doc(emailId).get();
      return result.exists;
    } catch (e) {
      print(e);
    }
  }
}

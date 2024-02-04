import 'package:chat_app/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier {
  // get instance of auth and firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Send message
  Future<void> sendMessage(String message) async {
    // get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    // create new message
    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      message: message,
      timestamp: timestamp,
    );

    // add new message to database
    await _firestore.collection("messages").add(newMessage.toMap());
  }

  // get message
  Stream<QuerySnapshot> getMessage(String userId, String otherUserid) {
    List<String> ids = [userId, otherUserid];
    ids.sort();
    return _firestore
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}

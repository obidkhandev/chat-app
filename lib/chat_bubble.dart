import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool currentUser;
  final TextAlign textAlign;
  const ChatBubble({
    super.key,
    required this.message,
    this.currentUser = true,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentUser
            ? Color.fromRGBO(39, 42, 53, 1)
            : Color.fromRGBO(55, 62, 78, 1),
      ),
      child: Text(
        message,
        textAlign: textAlign,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.white,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

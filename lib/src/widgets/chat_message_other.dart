import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_formatter/time_formatter.dart';

class ChatMessageOther extends StatelessWidget {
  final int index;
  final Map<String, dynamic> data;

  const ChatMessageOther({Key key, this.index, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(backgroundImage: NetworkImage(data['photo_url'])),
            SizedBox(width: 10),
            Container(
              constraints: BoxConstraints(
                maxWidth: 300,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${data['author']} said:',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontStyle: FontStyle.italic,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(data['value']),
                  SizedBox(height: 5),
                  Text(formatTime(data['timestamp']),
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontStyle: FontStyle.italic,
                          fontSize: 10,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ));
  }
}

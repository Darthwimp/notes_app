import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:notes_app/styles/styles.dart';
import 'homePage.dart';

class InputPage extends StatefulWidget {
  InputPage(this.doc, {super.key});
  QueryDocumentSnapshot doc;
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc["color_id"];
    return Scaffold(
      backgroundColor: cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: cardsColor[color_id],
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                DocumentReference documentReference =
                    FirebaseFirestore.instance.collection("Notes").doc();
                documentReference.delete();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              widget.doc["note_title"],
              style: noteTitle,
            ),
            Text(
              widget.doc["creation_date"],
              style: creationDate,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(widget.doc["note_content"],
                style: noteContent, overflow: TextOverflow.fade),
          ],
        ),
      ),
    );
  }
}

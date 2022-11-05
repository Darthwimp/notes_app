import 'package:flutter/material.dart';

import 'dart:math';
import 'package:notes_app/styles/styles.dart';

class InputEditor extends StatefulWidget {
  const InputEditor({super.key});

  @override
  State<InputEditor> createState() => InputEditorState();
}

class InputEditorState extends State<InputEditor> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController maincontroller = TextEditingController();

  int color_id = Random().nextInt(cardsColor.length);
  String date = DateTime.now().toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: cardsColor[color_id],
        elevation: 0,
        title: const Text("Add A New Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: titlecontroller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Note Title",
              ),
              style: noteTitle,
            ),
            const SizedBox( height: 8,),
            Text(date, style: creationDate,),
            const SizedBox( height: 30,),
            TextField(
              controller: maincontroller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Note Content",
              ),
              style: noteContent,
            ),
          ],
        ),
      ),
    );
  }
}

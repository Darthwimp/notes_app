import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:notes_app/screens/inputEdit.dart';
import 'package:notes_app/screens/inputPage.dart';
import 'package:notes_app/styles/styles.dart';
import 'package:notes_app/theme/themes.dart';
import 'package:notes_app/widgets/note_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: iconSwitch ? lightTheme : darkTheme,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.library_books_rounded),
          title: const Text("Notes"),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    iconSwitch = !iconSwitch;
                  });
                },
                icon: Icon(iconSwitch ? iconLight : iconDark))
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Your Recent Texts",
                  style: defaultFont,
                ),
                const SizedBox(height: 20),
                StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection("Notes").snapshots(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return Column(
                        children: snapshot.data!.docs
                            .map(
                              (note) => note_card(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => InputPage(note),
                                    ));
                              }, note),
                            )
                            .toList(),
                      );
                    }
                    return Text(
                      "There's no Text :(",
                      style: defaultFont,
                    );
                  }),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => InputEditor()));
          },
          icon: const Icon(
            Icons.add,
            size: 33,
          ),
          label: Text(
            "Add more?",
            style: defaultFont,
          ),
        ),
      ),
    );
  }
}

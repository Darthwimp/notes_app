import 'package:flutter/material.dart';

import 'package:notes_app/theme/themes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        body: const Center(child: Text("intial body text")),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

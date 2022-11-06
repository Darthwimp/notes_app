import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/styles/styles.dart';

Widget note_card(Function()? onTap, QueryDocumentSnapshot doc) => InkWell(
      onTap: onTap,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          padding: const EdgeInsets.all(8),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: cardsColor[doc["color_id"]],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Text(
                doc["note_title"],
                style: noteTitle,
              ),
              Text(
                doc["creation_date"],
                style: creationDate,
              ),
              Text(doc["note_content"],
                  style: noteContent, overflow: TextOverflow.fade),
            ],
          ),
        ),
      ),
    );

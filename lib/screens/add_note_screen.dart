import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff202124),
      appBar: AppBar(
        title: const Text(
          'New Note',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xfff8f8f8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.save,
              color: Colors.black,
            ),
            onPressed: () {
              add();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                cursorHeight: 30,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  // no border
                  border: InputBorder.none,
                  hintText: 'Title',

                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                  ),
                ),
                style: const TextStyle(
                  // color: Color(0xffEFEFEF),
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: TextField(
                  // autofocus: true,
                  maxLines: null,
                  expands: true,
                  controller: _contentController,
                  cursorHeight: 25,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    // no border
                    border: InputBorder.none,
                    hintText: 'Note',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void add() {
    final String title = _titleController.text;
    final String content = _contentController.text;
    if (title.isEmpty || content.isEmpty) {
      return;
    }
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('notes');

    var now = DateTime.now();

    var data = {
      'title': title,
      'content': content,
      'createdAt': now,
      'updatedAt': now,
    };
    ref.add(data);
    Navigator.pop(context);
  }
}

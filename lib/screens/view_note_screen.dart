import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewNotePage extends StatefulWidget {
  final String title;
  final String content;
  final DocumentReference? ref;

  const ViewNotePage(
      {Key? key, required this.title, required this.content, required this.ref})
      : super(key: key);
  @override
  State<ViewNotePage> createState() => _ViewNotePageState();
}

class _ViewNotePageState extends State<ViewNotePage> {
// firebase users note referance
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('notes');

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    _titleController.text = widget.title;
    _contentController.text = widget.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff202124),
      appBar: AppBar(
        title: const Text(
          'Edit Note',
          style: TextStyle(color: Colors.black),
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
              update();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete_forever,
              color: Colors.red[400],
            ),
            onPressed: () {
              delete();
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
                maxLines: null,
                style: const TextStyle(
                  color: Colors.black,
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
                    color: Colors.black,
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

  void update() async {
    final String title = _titleController.text;
    final String content = _contentController.text;
    if (title.isEmpty || content.isEmpty) {
      return;
    }

    var now = DateTime.now();

    var data = {
      'title': title,
      'content': content,
      'updatedAt': now,
    };
    await widget.ref?.update(data);
    Navigator.pop(context);
  }

  void delete() async {
    await widget.ref?.delete();
    Navigator.pop(context);
  }
}

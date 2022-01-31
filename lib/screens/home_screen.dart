import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/screens/add_note_screen.dart';
import 'package:note_app/screens/profile_screen.dart';
import 'package:note_app/screens/view_note_screen.dart';
import 'package:note_app/widgets/home_note_viewer.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('notes');

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white60,
        foregroundColor: Colors.black54,
        title: const Text('Notes'),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: ref.orderBy('updatedAt', descending: true).get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: snapshot.data?.docs.length == 0
                ? const Text('No Notes Available')
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 4),
                    ),
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () async {
                          var data = snapshot.data?.docs[index].data() as Map;
                          var referance = snapshot.data?.docs[index].reference;
                          await Navigator.of(context)
                              .push(
                                MaterialPageRoute(
                                  builder: (_) => ViewNotePage(
                                      title: data['title'],
                                      content: data['content'],
                                      ref: referance),
                                ),
                              )
                              .then((value) => {setState(() {})});
                        },
                        child: NoteContainer(
                          data: snapshot.data?.docs[index].data(),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[700],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 0:
              {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomePage();
                    },
                  ),
                );
              }
              break;
            case 1:
              {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return const ProfilePage();
                    },
                  ),
                );
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => const AddNotePage(),
            ),
          )
              .then((value) {
            setState(() {});
          });
        },
        child: const Icon(
          Icons.note_add,
          color: Colors.white,
        ),
        backgroundColor: Colors.grey[800],
      ),
    );
  }
}

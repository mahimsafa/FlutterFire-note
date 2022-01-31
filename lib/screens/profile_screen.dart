import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/controllers/google_auth.dart';
import 'package:note_app/screens/home_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser;
  convert() {
    var year = currentUser?.metadata.lastSignInTime?.year.toString();
    var month = currentUser?.metadata.lastSignInTime?.month.toString();
    var day = currentUser?.metadata.lastSignInTime?.day.toString();
    var hour = currentUser?.metadata.lastSignInTime?.hour.toString();
    var minute = currentUser?.metadata.lastSignInTime?.minute.toString();
    var second = currentUser?.metadata.lastSignInTime?.second.toString();
    var lastTime = '$hour:$minute:$second $day-$month-$year';
    return lastTime;
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 1;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[700],
                  backgroundImage: NetworkImage('${currentUser?.photoURL}'),
                  radius: MediaQuery.of(context).size.width / 4,
                ),
                const SizedBox(height: 20),
                Text(
                  '${currentUser?.displayName}',
                  style: const TextStyle(
                      fontSize: 24,
                      fontFamily: "Lora",
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Text(
                  '${currentUser?.email}',
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "Lora",
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Last signed in: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Lora",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${convert()}',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Lora",
                    fontWeight: FontWeight.w600,
                    color: Colors.amber[800],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[800],
                  ),
                  onPressed: () {
                    signOutGoogle(context);
                  },
                  child: const Text('Sign Out'),
                )
              ],
            ),
          ),
        ),
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
    );
  }
}

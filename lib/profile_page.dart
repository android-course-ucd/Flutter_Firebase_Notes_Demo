import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final User user;

  const ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Column(
          children: [
            Image.network(
                user.photoURL ?? "placeholder for a url to a default iamge"),
            Text(user.displayName ?? "No Name"),
            Text(user.email ?? "No Email"),
            OutlinedButton(
                style: OutlinedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Text("Sign out"))
          ],
        ),
      ),
    );
  }
}

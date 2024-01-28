import 'package:flutter/material.dart';
import 'package:sqliteproj/database/db.dart';

class ProfileScreen extends StatefulWidget {
  final String username;

  ProfileScreen({required this.username});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    if (widget.username.isNotEmpty) {
      // Fetch user data from the database based on the current username
      List<Map<String, dynamic>> userResult = await DatabaseHelper().getUser(widget.username);

      if (userResult.isNotEmpty) {
        setState(() {
          userData = userResult.first;
        });
      } else {
        // Handle the case where the user is not found
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: userData != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username: ${userData!['username']}'),
            Text('User ID: ${userData!['id']}'),
            // Add more user details as needed
          ],
        )
            : CircularProgressIndicator(),
      ),
    );
  }
}

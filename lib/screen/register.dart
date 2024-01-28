import 'package:flutter/material.dart';
import 'package:sqliteproj/database/db_helper.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final dbHelper = DBHelper(); // Ensure DBHelper instance is initialized


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                // Process registration
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Validate input (you may want to add more validation)
                if (username.isEmpty || password.isEmpty) {
                  // Show an error message or snackbar for empty fields
                  return;
                }

                // Create a user map
                Map<String, dynamic> user = {
                  'username': username,
                  'password': password,
                };

                // Insert the user into the 'users' table
                await dbHelper.insertUser(user);

                // For demonstration purposes, print the registration data
                print('Registered: Username: $username, Password: $password');

                // After registration, navigate to login page
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

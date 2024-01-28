import 'package:flutter/material.dart';
import 'package:sqliteproj/screen/home_screen.dart';
import 'package:sqliteproj/screen/profile_screen.dart';
import 'package:sqliteproj/screen/todolistScreen.dart';
import 'package:sqliteproj/screen/login_page.dart'; // Import the login page
import 'package:sqliteproj/screen/register.dart'; // Import the register page
import 'package:sqliteproj/model/todo_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Set the initial route to the login page
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(), // Login page route
        '/home': (context) => BottomNavigationScreen(), // Home route
      },
    );
  }
}
class AuthService {
  String? currentUser;

  Future<bool> login(String username, String password) async {
    // Perform your authentication logic, set currentUser if successful
    // For simplicity, let's assume the login is always successful
    currentUser = username;
    return true;
  }

  void logout() {
    // Implement logout logic
    currentUser = null;
  }
}

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  // Initialize an empty list for todos
  List<Todo> _todos = [];

  // List of screens for the bottom navigation bar
  late List<Widget> _tabs;

  @override
  void initState() {
    super.initState();

    // Initialize _tabs here
    _tabs = [
      // Pass the callback function to TodoListScreen
      TodoListScreen(onTodoListUpdated: _updateTodoList),
      // Display the HomeScreen with the current list of todos
      HomeScreen(todos: _todos),
      ProfileScreen(username: 'Azieyati',),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Todo List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Callback function to update the list of todos in HomeScreen
  void _updateTodoList(List<Todo> updatedTodos) {
    setState(() {
      // Update the HomeScreen with the latest list of todos
      _tabs[1] = HomeScreen(todos: updatedTodos);
    });
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // 1. Import Firebase
import 'screens/contacts_screen.dart';

// 2. Turn the main function into an async function
void main() async {
  // 3. This line is required when using 'await' in main
  WidgetsFlutterBinding.ensureInitialized();

  // 4. Start Firebase!
  await Firebase.initializeApp();

  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const ContactsScreen(),
    );
  }
}
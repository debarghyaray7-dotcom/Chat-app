import 'package:flutter/material.dart';
import 'chat_screen.dart'; // Import your chat screen

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  final List<Map<String, String>> contacts = const [
    {'name': 'Deadpool', 'status': 'Maximum effort!'},
    {'name': 'Wolverine', 'status': 'Go away.'},
    {'name': 'Spider-Man', 'status': 'Friendly neighborhood...'},
    {'name': 'Iron Man', 'status': 'I am Iron Man.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFE1BEE7), // Lavender theme
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFFFFEB3B), // Yellow theme
              child: Text(contacts[index]['name']![0]), // First letter of name
            ),
            title: Text(contacts[index]['name']!),
            subtitle: Text(contacts[index]['status']!),
            onTap: () {
              // Navigate to Chat Screen when tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    friendName: contacts[index]['name']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
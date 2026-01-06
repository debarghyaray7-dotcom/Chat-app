import 'package:flutter/material.dart';
import '../widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  final String friendName; // This holds the name passed from the list
  const ChatScreen({super.key, required this.friendName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {'text': 'Hello 👋', 'isMe': false},
    {'text': 'Hi! How are you?', 'isMe': true},
  ];

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _messages.add({
        'text': _controller.text,
        'isMe': true,
      });
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BACKGROUND: Very Light Lavender
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        title: Text(
          widget.friendName, // CHANGED: Uses the name passed from Contacts
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        // ... rest of your AppBar code ...
        centerTitle: true,
        // APP BAR: Soft Lavender
        backgroundColor: const Color(0xFFE1BEE7),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black54),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  text: _messages[index]['text'],
                  isMe: _messages[index]['isMe'],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        prefixIcon: Icon(Icons.emoji_emotions_outlined, color: Colors.purpleAccent),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // SEND BUTTON: Bright Yellow
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFFFFEB3B), // Yellow
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        )
                      ]
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.purple), // Purple Icon
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
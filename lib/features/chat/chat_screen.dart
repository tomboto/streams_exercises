import 'package:flutter/material.dart';
import 'package:streams_exercises/features/chat/chat_repository.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
    required this.chatRepository,
  });

  final ChatRepository chatRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
      body: const Center(
        child: Text("Hier sollen die Chatnachrichten stehen"),
      ),
    );
  }
}

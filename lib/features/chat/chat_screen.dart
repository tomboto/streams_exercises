import 'package:flutter/material.dart';
import 'package:streams_exercises/features/chat/chat_repository.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.chatRepository,
  });

  final ChatRepository chatRepository;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    // Nachrichten senden starten
    widget.chatRepository.startSendingMessages();
  }

  @override
  void dispose() {
    // ChatRepository aufräumen
    widget.chatRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
      body: Center(
        child: StreamBuilder(
            stream: widget.chatRepository.messages,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data == null) {
                return const Text('Keine Nachrichten');
              } else {
                final message = snapshot.data!;
                return Text('${message.user}: ${message.message}');
              }
            }),
      ),
    );
  }
}

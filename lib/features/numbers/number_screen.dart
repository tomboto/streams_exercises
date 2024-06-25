import 'package:flutter/material.dart';
import 'package:streams_exercises/features/numbers/number_repository.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({
    super.key,
    required this.numberRepository,
  });

  final NumberRepository numberRepository;

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  @override
  void initState() {
    super.initState();
    // Lade Zahlen
    widget.numberRepository.getNumberStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Screen'),
      ),
      body: Center(
        child: StreamBuilder<int>(
            stream: widget.numberRepository.getNumberStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data == null) {
                return const Text('Keine Zahlen');
              } else {
                return Text(snapshot.data.toString());
              }
            }),
      ),
    );
  }
}

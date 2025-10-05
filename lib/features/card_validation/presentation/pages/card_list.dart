import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card List'),
      ),
      body: const Center(
        child: Text('Card List Screen'),
      ),
    );
  }
}
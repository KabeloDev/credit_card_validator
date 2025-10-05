import 'package:flutter/material.dart';

class CardForm extends StatelessWidget {
  const CardForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Form'),
      ),
      body: const Center(
        child: Text('Card Form Screen'),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ScanCardButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ScanCardButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text('Scan Card'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddCountryField extends StatefulWidget {
  final void Function(String) onAdd;

  const AddCountryField({super.key, required this.onAdd});

  @override
  State<AddCountryField> createState() => _AddCountryFieldState();
}

class _AddCountryFieldState extends State<AddCountryField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (_controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a country'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    widget.onAdd(_controller.text);
    _controller.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Country added successfully!'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Add Country',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(onPressed: _submit, child: const Text('Add')),
      ],
    );
  }
}

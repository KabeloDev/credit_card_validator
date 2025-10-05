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
    widget.onAdd(_controller.text);
    _controller.clear();
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

import 'package:flutter/material.dart';

class BannedCountryList extends StatelessWidget {
  final List<String> countries;
  final void Function(int, String) onEdit;
  final void Function(int) onDelete;

  const BannedCountryList({
    super.key,
    required this.countries,
    required this.onEdit,
    required this.onDelete,
  });

  void _showEditDialog(BuildContext context, int index, String current) {
    final editController = TextEditingController(text: current);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Edit Country'),
        content: TextField(controller: editController),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              onEdit(index, editController.text);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (context, index) {
        final country = countries[index];
        return Card(
          child: ListTile(
            title: Text(country),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showEditDialog(context, index, country),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => onDelete(index),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

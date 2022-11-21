import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {
  final controller;
  final String hintText;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const MyAlertBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(300)),
        child: AlertDialog(
          backgroundColor: Colors.black54.withOpacity(0.4),
          content: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.black87),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.black87),
              ),
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: onSave,
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.deepPurple[500],
            ),
            MaterialButton(
              onPressed: onCancel,
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.deepPurple[500],
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  final String error;

  const ErrorBox({super.key, required this.error});

  @override
  Widget build(Object context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.red.shade200,
      ),
      child: Text(
        error,
        textAlign: TextAlign.center,
      ),
    );
  }
}

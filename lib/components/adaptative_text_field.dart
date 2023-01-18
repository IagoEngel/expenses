import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final TextInputType keyboardType;

  const AdaptativeTextField(
      {required this.label,
      required this.controller,
      required this.onSubmitted,
      this.keyboardType = TextInputType.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CupertinoTextField(
              controller: controller,
              onSubmitted: onSubmitted,
              placeholder: label,
              keyboardType: keyboardType,
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
        )
        : TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              labelText: label,
            ),
            keyboardType: keyboardType,
          );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextInputType type;
  final TextEditingController controller;
  final Function(String) onSubmitted;

  AdaptativeTextField({this.label, this.type, this.controller, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CupertinoTextField(
              placeholder: label,
              keyboardType: type,
              controller: controller,
              onSubmitted: onSubmitted,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12
              ),
            ),
        )
        : Container(
            child: TextField(
              controller: controller,
              keyboardType: type,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
          );
  }
}

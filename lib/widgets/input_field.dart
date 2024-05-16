import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {

  const InputField({
    super.key,
    this.controller,
    this.labelText,
    this.prerequisite,
    this.inputFormatters,
    this.numberInputOnly = false,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? Function(String?)? prerequisite;
  final bool numberInputOnly;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        labelText: widget.labelText,
        border: const OutlineInputBorder(),
      ),
      validator: widget.prerequisite,
      keyboardType: widget.numberInputOnly == true ? TextInputType.number : TextInputType.text,
      inputFormatters: widget.numberInputOnly == true ? [FilteringTextInputFormatter.digitsOnly] : []
    );
  }
}

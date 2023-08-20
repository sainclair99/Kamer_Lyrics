import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class InputFormField extends StatefulWidget {
  final String? label;
  final TextInputType? keyboardType;
  final String? hintText;
  final TextEditingController? controller;
  final List<String? Function(String?)> validators;
  final Iterable<String>? autofillHints;

  const InputFormField({
    super.key,
    this.label = null,
    this.keyboardType,
    this.hintText,
    this.controller,
    this.validators = const [],
    this.autofillHints,
  });

  @override
  State<InputFormField> createState() => _InputFormFieldState();
}

class _InputFormFieldState extends State<InputFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Text(
                widget.label!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const SizedBox(height: 0, width: 0),
        SizedBox(
          height: 50,
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            maxLines: 1,
            autofillHints: widget.autofillHints,
            validator: FormBuilderValidators.compose(widget.validators),
            decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding:
                  const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              filled: true,
              fillColor: Colors.white.withOpacity(0.8),
            ),
          ),
        ),
      ],
    );
  }
}

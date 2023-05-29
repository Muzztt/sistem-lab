import 'package:flutter/material.dart';

class QTextField extends StatefulWidget {
  final String? id;
  final String label;
  final String? value;
  final String? hint;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool enabled;
  final int? maxLength;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;

  const QTextField({
    Key? key,
    required this.label,
    this.id,
    this.value,
    this.validator,
    this.hint,
    this.maxLength,
    required this.onChanged,
    this.onSubmitted,
    this.obscure = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<QTextField> createState() => _QTextFieldState();
}

class _QTextFieldState extends State<QTextField> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.text = widget.value ?? "";
    super.initState();
  }

  @override
  getValue() {
    return textEditingController.text;
  }

  @override
  setValue(value) {
    textEditingController.text = value;
  }

  @override
  resetValue() {
    textEditingController.text = "";
  }

  @override
  focus() {
    focusNode.requestFocus();
  }

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: textEditingController,
      focusNode: focusNode,
      validator: (value) {
        if (widget.validator != null) {
          String? errorText = widget.validator!(value);
          if (errorText != null) {
            return errorText;
          } else {
            return null;
          }
        } else {
          return null;
        }
      },
      maxLength: widget.maxLength,
      obscureText: widget.obscure,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: Colors.blueGrey,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).errorColor,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).errorColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          widget.suffixIcon ?? Icons.text_format,
        ),
        helperText: widget.hint,
      ),
      onChanged: (value) {
        widget.onChanged(value);
      },
      onFieldSubmitted: (value) {
        if (widget.onSubmitted != null) widget.onSubmitted!(value);
      },
    );
  }
}

import 'package:custom_widgets_flutter/enums/app_ui_enums.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final InputFieldType fieldType;
  final String label;
  final String? hintText;
  final bool isPassword;
  final bool isReadOnly;
  final bool isEnabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int? maxLines;
  final int? minLines;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.fieldType,
    required this.label,
    this.hintText,
    this.isPassword = false,
    this.isReadOnly = false,
    this.isEnabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.minLines,
  });

  TextInputType _getKeyboardType() {
    switch (fieldType) {
      case InputFieldType.email:
        return TextInputType.emailAddress;
      case InputFieldType.password:
        return TextInputType.visiblePassword;
      case InputFieldType.number:
        return TextInputType.number;
      case InputFieldType.search:
        return TextInputType.text;
      case InputFieldType.url:
        return TextInputType.url;
      case InputFieldType.multiline:
        return TextInputType.multiline;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: _getKeyboardType(),
      obscureText: isPassword,
      readOnly: isReadOnly,
      enabled: isEnabled,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: const OutlineInputBorder(),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      minLines: minLines,
    );
  }
}

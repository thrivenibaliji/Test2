
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:triveni_3399/utils/color_constants.dart';

class InputTextFieldWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final String? labelText;

  const InputTextFieldWidget({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.readOnly = false,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.maxLines = 1,
    this.labelText, required Color textColor, required Color hintTextColor,
  });

  @override
  _InputTextFieldWidgetState createState() => _InputTextFieldWidgetState();
}

class _InputTextFieldWidgetState extends State<InputTextFieldWidget> {
  final FocusNode _focusNode = FocusNode();
  bool _hasFocus = false;
  bool _isNotEmpty = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
    widget.textEditingController.addListener(() {
      setState(() {
        _isNotEmpty = widget.textEditingController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        maxLines: widget.maxLines,
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        readOnly: widget.readOnly,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorsConstants.inputTextfillColor,
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          labelStyle: TextStyle(
            color: (_hasFocus || _isNotEmpty) ? Colors.blue : Colors.grey,
          
          
          ),
        ),
      ),
    );
  }
}

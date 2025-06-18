import 'package:flutter/material.dart';

import '../../../../../core/functions/custom_validator.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    super.key,
    required this.textEditingController,
  });
  final TextEditingController textEditingController;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool isobsecureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isobsecureText,
      controller: widget.textEditingController,
      validator: CustomValidator.passwordValidator,
      decoration: InputDecoration(
        labelText: "Password",
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () {
            isobsecureText = !isobsecureText;
            setState(() {});
          },
          icon: Icon(
            isobsecureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
        ),
      ),
    );
  }
}

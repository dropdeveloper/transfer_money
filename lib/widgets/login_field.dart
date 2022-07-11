import 'package:flutter/material.dart';
import 'package:money_transfer/styles/text_styles.dart';

class InputField extends StatefulWidget {
  final String hint;
  final bool secureField;
  final TextInputType inputType;
  const InputField({Key? key, required this.hint, this.secureField = false, this.inputType = TextInputType.emailAddress}) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool secure = false;
  @override
  void initState() {
    secure = widget.secureField;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      style: fieldTitleStyle,
      obscureText: secure,
      textInputAction: TextInputAction.next,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        labelText: widget.hint,
        labelStyle: hintTitleStyle,
        floatingLabelStyle: hintTitleStyle,
        suffix: widget.secureField
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    secure = !secure;
                  });
                },
                child: Text(secure ? "show" : "hide", style: showHideTitleStyle),
              )
            : null,
      ),
    );
  }
}

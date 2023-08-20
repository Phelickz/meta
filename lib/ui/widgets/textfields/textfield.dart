import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meta_trader/app/utils/theme.dart';

class CustomTextFields extends StatefulWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? label;
  final String? hintText;
  final String? helperText;
  final bool? filledWithColor;
  final bool? password;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final InputDecoration? inputDecoration;
  const CustomTextFields({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    this.helperText,
    this.password = false,
    this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.inputDecoration,
    this.hintText,
    this.filledWithColor = false,
  }) : super(key: key);

  @override
  _SignupTextFieldsState createState() => _SignupTextFieldsState();
}

class _SignupTextFieldsState extends State<CustomTextFields> {
  FocusNode? _focusNode;
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode!.dispose();
    super.dispose();
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: widget.onChanged,
      controller: widget.controller,
      focusNode: _focusNode,
      onTap: _requestFocus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.password! ? _visible : false,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.black87,
          ),
      decoration: InputDecoration(
        // contentPadding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
        filled: widget.filledWithColor ?? false,
        fillColor: widget.filledWithColor == true
            ? const Color(0xffE2E8F0)
            : Theme.of(context).colorScheme.secondary,
        suffixIcon: widget.password!
            ? IconButton(
                icon: _visible
                    ? const Icon(
                        Icons.visibility,
                        color: Color(0xffacacac),
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: Color(0xffacacac),
                      ),
                onPressed: () {
                  setState(() {
                    _visible = !_visible;
                  });
                },
              )
            : widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        helperText: widget.helperText,
        // helperStyle: GoogleFonts.roboto(
        //   color: _focusNode.hasFocus ? Constants.purple : Colors.white,
        // ),
        hintText: widget.hintText,
        hintStyle: CustomThemeData.generateStyle(
          fontSize: 15,
          color: const Color(0xff98A2B3),
        ),
        labelStyle: Theme.of(context).textTheme.titleSmall,
        labelText: widget.label,

        // fillColor:Colors.black54,
        // filled: true,
        errorStyle: GoogleFonts.openSans(color: Colors.red),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black26, width: 1.3),
            borderRadius: BorderRadius.circular(8)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

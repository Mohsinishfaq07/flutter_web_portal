import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_theme.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool allowNumbersOnly; // Add this parameter
  String hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool obsecure;
  bool isPassword;
  double height;
  double width;
  TextInputType? textInputType;
  TextInputAction? textInputAction;
  Function(String value)? onChanged;
  EdgeInsetsGeometry? contentPadding;
  Function()? ontapped;
  bool readonly;
  CustomTextFormField(
      {Key? key,
      required this.controller,
        required this.allowNumbersOnly,
      this.hintText = "Input here",
      this.height = 55,
      this.width = double.infinity,
      this.prefixIcon,
      this.suffixIcon,
      this.focusNode,
      this.onChanged,
      this.obsecure = false,
      this.isPassword = false,
      this.contentPadding,
      this.ontapped,
      this.readonly = false,
      this.textInputType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      required String? Function(dynamic value) validator})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: widget.width,
      alignment: Alignment.center,
      //  padding: EdgeInsets.symmetric(horizontal: 8.sp),
      decoration: AppTheme.roundedContainerDecoration,
      child: TextFormField(
        inputFormatters:  widget.allowNumbersOnly    ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]
        : null,



        textInputAction: widget.textInputAction,
        onTap: widget.ontapped,
        obscureText: widget.obsecure,
        readOnly: widget.readonly,
        obscuringCharacter: "*",
        style: AppTheme.heading1
            .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
        cursorColor: Colors.grey,
        onChanged: widget.onChanged ?? (value) {},
        controller: widget.controller,
        keyboardType: widget.textInputType,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding:
                widget.contentPadding ?? EdgeInsets.symmetric(vertical: 15),
            hintStyle: AppTheme.subtitle1
                .copyWith(fontSize: 15, fontWeight: FontWeight.normal),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: (() {
                      setState(() {
                        widget.obsecure = !widget.obsecure;
                      });
                    }),
                    icon: Icon(
                      color: AppTheme.primaryColor,
                      widget.obsecure ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : widget.suffixIcon ?? const SizedBox.shrink(),
            border: InputBorder.none),
      ),
    );
  }
}

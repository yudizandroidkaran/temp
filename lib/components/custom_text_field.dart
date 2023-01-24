import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType? textInputType;
  final String hintText;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;
  final String? validateParam;
  final TextInputAction? inputAction;
  final int? maxLength;
  final Function? onClick;
  final bool? enabled;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? textInputFormatter;

  const CustomTextField(
      {Key? key,
      this.textInputType,
      required this.hintText,
      this.prefixIcon,
      this.obscureText,
      required this.textEditingController,
      this.validator,
      this.validateParam,
      this.inputAction,
      this.maxLength,
      this.onClick,
      this.enabled,
      this.focusNode,
      this.textInputFormatter})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: TextFormField(
        textInputAction: widget.inputAction ?? TextInputAction.next,
        keyboardType: widget.textInputType ?? TextInputType.text,
        cursorColor: Theme.of(context).primaryColor,
        obscureText: widget.obscureText ?? false,
        controller: widget.textEditingController,
        maxLength: widget.maxLength ?? 100,
        enabled: widget.enabled ?? true,
        autofocus: false,
        inputFormatters: widget.textInputFormatter,
        style: TextStyle(fontSize: 12.sp),
        decoration: InputDecoration(
          hintText: widget.hintText,
          counterText: "",
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: widget.prefixIcon,
          contentPadding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).focusColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).primaryColor, width: 0.5.w)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).focusColor)),
        ),
        validator: widget.validator,
      ),
    );
  }
}

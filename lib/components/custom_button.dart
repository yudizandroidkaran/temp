import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatefulWidget {
  final String buttonText;
  final Function onClick;
  final bool? isEnabled;

  const CustomButton(
      {Key? key,
      required this.onClick,
      required this.buttonText,
      this.isEnabled})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isEnabled ?? true) {
          widget.onClick();
        }
      },
      child: Container(
        width: double.infinity,
        height: 5.h,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            color: widget.isEnabled ?? true
                ? Theme.of(context).primaryColor
                : Theme.of(context).focusColor,
            borderRadius: BorderRadius.all(Radius.circular(2.w))),
        child: Center(
            child: Text(
          widget.buttonText,
          style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}

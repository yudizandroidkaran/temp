import 'package:azure_car/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class QuestionEdittext extends StatefulWidget {
  final int? index;
  final String question;
  final TextEditingController textEditingController;

  const QuestionEdittext({Key? key,
    this.index,
    required this.question,
    required this.textEditingController})
      : super(key: key);

  @override
  State<QuestionEdittext> createState() => _QuestionEdittextState();
}

class _QuestionEdittextState extends State<QuestionEdittext> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              children: [
                widget.index != 0 && widget.index != null ?
                Text(
                  "${widget.index}. ",
                  style: TextStyle(
                      fontSize: 12.sp, fontWeight: FontWeight.bold),
                ) : Container(),
                Expanded(
                  child: Text(
                    widget.question,
                    style: TextStyle(
                        fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.w),
          CustomTextField(hintText: "Test Hint",
              textEditingController: widget.textEditingController)
        ],
      ),
    );
  }
}

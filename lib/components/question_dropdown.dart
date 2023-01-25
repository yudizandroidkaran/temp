import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class QuestionDropdown extends StatefulWidget {
  final int? index;
  final String question;
  final List<String> dropDownItems;
  final Function onValueChanged;

  const QuestionDropdown(
      {Key? key,
      this.index,
      required this.question,
      required this.dropDownItems,
      required this.onValueChanged})
      : super(key: key);

  @override
  State<QuestionDropdown> createState() => _QuestionDropdownState();
}

class _QuestionDropdownState extends State<QuestionDropdown> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();

    _selectedValue = widget.dropDownItems[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.index != 0 && widget.index != null
              ? Row(
                  children: [
                    Text(
                      "${widget.index}. ",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        widget.question,
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              : Text(
                  widget.question,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
          SizedBox(height: 4.w),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(4.w, 0, 3.w, 0),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).focusColor, width: 0.2.w),
                borderRadius: BorderRadius.all(Radius.circular(1.w))),
            child: DropdownButtonHideUnderline(
                child: DropdownButton(
              items: widget.dropDownItems
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    maxLines: 1,
                    style: TextStyle(fontSize: 11.sp, color: Colors.black),
                  ),
                );
              }).toList(),
              value: _selectedValue,
              onChanged: (String? value) {
                setState(() {
                  _selectedValue = value!;
                });
                widget.onValueChanged(value);
              },
            )),
          )
        ],
      ),
    );
  }
}

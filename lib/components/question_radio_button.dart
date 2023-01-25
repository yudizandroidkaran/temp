import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:sizer/sizer.dart';

class QuestionRadioGroup extends StatefulWidget {
  final int? index;
  final String question;
  final List<String> items;
  final Axis? direction;
  final Function onValueChanged;

  const QuestionRadioGroup(
      {Key? key,
      required this.question,
      this.index,
      required this.items,
      this.direction,
      required this.onValueChanged})
      : super(key: key);

  @override
  State<QuestionRadioGroup> createState() => _QuestionRadioGroupState();
}

class _QuestionRadioGroupState extends State<QuestionRadioGroup> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();

    _selectedValue = widget.items[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        children: [
          Row(
            children: [
              widget.index != 0 && widget.index != null
                  ? Text(
                      "${widget.index}. ",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    )
                  : Container(),
              Expanded(
                child: Text(
                  widget.question,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.w),
          RadioGroup<String>.builder(
            groupValue: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value as String;
              });
              widget.onValueChanged(value);
            },
            items: widget.items,
            itemBuilder: (item) => RadioButtonBuilder(
              item,
            ),
            direction: widget.direction ?? Axis.vertical,
            horizontalAlignment: MainAxisAlignment.start,
            activeColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}

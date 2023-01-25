import 'package:azure_car/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class QuestionDatePicker extends StatefulWidget {
  final int? index;
  final String question;
  final Function onDateChanged;
  final bool? showFutureDate;

  const QuestionDatePicker(
      {Key? key,
      this.index,
      required this.question,
      required this.onDateChanged,
      this.showFutureDate})
      : super(key: key);

  @override
  State<QuestionDatePicker> createState() => _QuestionDatePickerState();
}

class _QuestionDatePickerState extends State<QuestionDatePicker> {
  final TextEditingController _dateController = TextEditingController();
  var _selectedDate = DateTime.now();

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
          ),
          SizedBox(height: 4.w),
          GestureDetector(
            onTap: () {
              _selectDate(context, widget.showFutureDate ?? true)
                  .then((value) {
                if (value != null) {
                  _selectedDate = value;
                  setState(() {
                    _dateController.text = _formatDate(value);
                  });
                  widget.onDateChanged(_formatDate(value));
                }
              });
            },
            child: CustomTextField(
              hintText: "Pick date",
              textEditingController: _dateController,
              suffixIcon: const Icon(Icons.date_range),
              enabled: false,
            ),
          )
        ],
      ),
    );
  }

  Future<DateTime?> _selectDate(
      BuildContext context, bool showFutureDate) async {
    return await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1920),
        lastDate: showFutureDate ? DateTime(2035) : DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme:
                  ColorScheme.light(primary: Theme.of(context).primaryColor),
              dialogBackgroundColor: Colors.white,
            ),
            child: child as Widget,
          );
        });
  }

  String _formatDate(DateTime picked) {
    return "${picked.day}-${picked.month}-${picked.year}";
  }
}

import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:sizer/sizer.dart';

class CustomRadioGroup extends StatefulWidget {
  final List<String> items;
  final Axis? direction;
  final Function onValueChanged;

  const CustomRadioGroup(
      {Key? key,
      required this.items,
      this.direction,
      required this.onValueChanged})
      : super(key: key);

  @override
  State<CustomRadioGroup> createState() => _CustomRadioGroupState();
}

class _CustomRadioGroupState extends State<CustomRadioGroup> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();

    _selectedValue = widget.items[0];
  }

  @override
  Widget build(BuildContext context) {
    return RadioGroup<String>.builder(
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
    );
  }
}

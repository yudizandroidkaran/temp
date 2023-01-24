import 'package:azure_car/components/custom_button.dart';
import 'package:azure_car/components/custom_radio_button.dart';
import 'package:azure_car/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final TextEditingController _testController = TextEditingController();
  String _selectedValue = "Item 1";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          SizedBox(height: 20.w),
          Text("Demo Screen", style: TextStyle(fontSize: 17.sp)),
          SizedBox(height: 20.w),
          CustomTextField(
              textEditingController: _testController,
              hintText: "Test Edittext"),
          SizedBox(height: 20.w),
          CustomButton(buttonText: "Sample Button", onClick: () {}),
          SizedBox(height: 20.w),
          CustomRadioGroup(
            items: ["Item 1", "Item 2", "Item 3"],
            onValueChanged: (value) {
              setState(() {
                _selectedValue = value;
              });
            },
          ),
          Text("Selected Value : " + _selectedValue)
        ],
      )),
    );
  }
}

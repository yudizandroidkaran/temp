import 'package:azure_car/components/custom_button.dart';
import 'package:azure_car/components/question_radio_button.dart';
import 'package:azure_car/components/custom_text_field.dart';
import 'package:azure_car/components/question_datepicker.dart';
import 'package:azure_car/components/question_dropdown.dart';
import 'package:azure_car/components/question_edittext.dart';
import 'package:azure_car/components/question_image_picker.dart';
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
  String _selectedDropdownValue = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
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
            QuestionRadioGroup(
              question: "Question radio button",
              items: const ["Item 1", "Item 2", "Item 3"],
              onValueChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
            Text("Selected Value : $_selectedValue"),
            SizedBox(height: 20.w),
            QuestionDropdown(
                question: "Question 1",
                dropDownItems: ["Option 1", "Option 2"],
                onValueChanged: (String value) {
                  setState(() {
                    _selectedDropdownValue = value;
                  });
                }),
            SizedBox(height: 7.w),
            Text("Selected Dropdown Value : $_selectedDropdownValue"),
            SizedBox(height: 20.w),
            QuestionEdittext(
                question: "Test Question",
                textEditingController: _testController,
                index: 1),
            SizedBox(height: 20.w),
            QuestionDatePicker(
                question: "Date picker question", onDateChanged: (date) {}, index: 2),
            SizedBox(height: 20.w),
            QuestionImagePicker(question: "Question image", onImagePicked: (value){

            }),
            SizedBox(height: 20.w),
          ],
        ),
      )),
    );
  }
}

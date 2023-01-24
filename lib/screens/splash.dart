import 'package:azure_car/components/custom_button.dart';
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
          CustomButton(buttonText: "Sample Button", onClick: () {})
        ],
      )),
    );
  }
}

import 'dart:io';

import 'package:azure_car/components/custom_text_field.dart';
import 'package:azure_car/utils/permission_handler.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

class QuestionImagePicker extends StatefulWidget {
  final int? index;
  final String question;
  final Function onImagePicked;

  const QuestionImagePicker(
      {Key? key,
      this.index,
      required this.question,
      required this.onImagePicked})
      : super(key: key);

  @override
  State<QuestionImagePicker> createState() => _QuestionImagePickerState();
}

class _QuestionImagePickerState extends State<QuestionImagePicker> {

  File? pickedImage;
  String pickedImageName = "";

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(children: [
              Container(
                height: 25.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        spreadRadius: 0,
                        blurRadius: 0.5.w),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: pickedImage == null
                      ? pickedImageName.isEmpty
                      ? Image.asset(
                      "assets/images/placeholder.png")
                      : CachedNetworkImage(
                      imageUrl: "",
                      imageBuilder:
                          (context, imageProvider) =>
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill),
                            ),
                          ))
                      : Image.file(
                    pickedImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 1.h,
                bottom: 1.h,
                child: SizedBox(
                  height: 14.w,
                  width: 14.w,
                  child: FloatingActionButton(
                      onPressed: () async {
                        showImagePickerDialog();
                      },
                      backgroundColor:
                      Theme.of(context).primaryColor,
                      child: Image.asset(
                        "assets/images/upload.png",
                        width: 6.w,
                        color: Colors.white,
                      )),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }

  showImagePickerDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.w),
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pick image",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Theme.of(context).primaryColor),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(dialogContext);
                      },
                      child: Icon(
                        Icons.close,
                        color: Theme.of(context).primaryColor,
                        size: 6.w,
                      ))
                ]),
            content: Text(
              "Pick image from...",
              style: TextStyle(fontSize: 14.sp, color: Colors.black),
            ),
            actionsPadding: EdgeInsets.fromLTRB(0, 0, 0, 5.w),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: [
              GestureDetector(
                  onTap: () async {
                    Navigator.pop(dialogContext);
                    PermissionHandler.askPermission(Permission.camera).then((value) async {
                      if(value.isGranted){
                        await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 70).then((value){
                          if(value != null){
                            setState(() {
                              pickedImage = File(value!.path);
                            });
                            widget.onImagePicked(value);
                          }
                        });
                      }
                      else{
                        PermissionHandler.showPermissionDialog(context, value.isPermanentlyDenied, Permission.camera);
                      }
                    });
                  },
                  child: Container(
                    height: 17.w,
                    width: 17.w,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Icon(Icons.camera_alt_outlined,
                        color: Colors.white, size: 10.w),
                  )),
              GestureDetector(
                  onTap: () async {
                    Navigator.pop(dialogContext);
                    PermissionHandler.askPermission(Permission.photos).then((value) async {
                      if(value.isGranted){
                        await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70).then((value){
                          if(value != null){
                            setState(() {
                              pickedImage = File(value.path);
                            });
                            widget.onImagePicked(value);
                          }
                        });
                      }
                      else{
                        PermissionHandler.showPermissionDialog(context, value.isPermanentlyDenied, Permission.photos);
                      }
                    });
                  },
                  child: Container(
                    height: 17.w,
                    width: 17.w,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Icon(Icons.photo_camera_back,
                        color: Colors.white, size: 10.w),
                  )),
            ],
          );
        });
  }
}

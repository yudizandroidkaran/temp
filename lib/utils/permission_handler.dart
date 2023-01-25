import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

class PermissionHandler {

  static Future<PermissionStatus> askPermission(Permission permission) async {
    var status = await permission.status;
    if (status.isDenied) {
      var newStatus = await permission.request();

      return newStatus;
    } else {
      return status;
    }
  }

  static showPermissionDialog(BuildContext context, bool isPermissionPermanentlyDenied,
      Permission permission) {
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
                  "Permission required",
                  style: TextStyle(
                      fontSize: 13.sp, color: Theme.of(context).primaryColor),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(dialogContext);
                    },
                    child: Icon(
                      Icons.close,
                      color: Theme.of(context).primaryColor,
                      size: 6.w,
                    )),
              ],
            ),
            content: isPermissionPermanentlyDenied
                ? Text(
                    "Permission for ${permission.toString()} is required. Please click 'Yes' to provide permission from settings.",
                    style: TextStyle(color: Colors.black, fontSize: 12.sp))
                : Text("Permission for ${permission.toString()} is required.",
                    style: TextStyle(color: Colors.black, fontSize: 12.sp)),
            actionsPadding: EdgeInsets.fromLTRB(0, 0, 0, 5.w),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 12.sp),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (isPermissionPermanentlyDenied) {
                    Navigator.of(context).pop();
                    await openAppSettings();
                  } else {
                    Navigator.of(context).pop();
                    askPermission(permission);
                  }
                },
                child: Text(
                  "Yes",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 12.sp),
                ),
              ),
            ],
            actionsAlignment: MainAxisAlignment.spaceAround,
          );
        });
  }
}

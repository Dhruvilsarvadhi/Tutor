import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tutor/src/constant/navigation.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Logout'),
      content: Text(
        'Are you sure you want to logout?',
        style: TextStyle(fontSize: 18.0.sp),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            NavigateUtils.close(
              context,
            ); // Dismiss the dialog with a false value
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            NavigateUtils.close(context);
           
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}

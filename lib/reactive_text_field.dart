import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DefaultReactiveTextField extends StatelessWidget {
   DefaultReactiveTextField({super.key, this.formControlName,
    this.obscureText, this.validationMessages, this.suffixIcon, this.keyboardType,
    this.onPressed, this.controller, this.iconSize, this.iconColor,
     this.enabled,});

  final String? formControlName;
  final bool ? obscureText;
  final Map<String, ValidationMessageFunction>? validationMessages;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final VoidCallback? onPressed;
  final TextEditingController? controller;
  final double? iconSize;
  final Color? iconColor;
  final bool ?enabled;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      style: TextStyle(fontSize: 17.sp,
      ),
      formControlName: formControlName,
      obscureText: obscureText!,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: 1,
      validationMessages: validationMessages,
      decoration: InputDecoration(
          contentPadding: REdgeInsets.only(left: 8,top: 13.5,bottom: 13.5,right: 32),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(suffixIcon, size: iconSize, color: iconColor),
        ),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(width: 0.5.sp,color: Color(0xff808194),
        )

    ),
        enabled: enabled!

      ),
    );
  }
}

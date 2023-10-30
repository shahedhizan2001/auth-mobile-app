import 'package:auth/reactive_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      this.text,
      this.iconData,
      this.textInputType,
      this.onPressed,
      this.formControlName, this.obscureText=false,
        this.validationMessages, this.enabled=true,
      });

  final String? text;
  final IconData? iconData;
  final TextInputType? textInputType;
  final VoidCallback? onPressed;
  final String? formControlName;
  final bool ? obscureText;
  final Map<String, ValidationMessageFunction>? validationMessages;
  final bool ?enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: REdgeInsets.only(bottom: 8),
          child: Text(
            text!,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff808194)),
          ),
        ),
        RPadding(
          padding: const EdgeInsets.only(bottom: 22),
          child: RSizedBox(height: 44,
            width: 345,
            child: DefaultReactiveTextField(
              formControlName: formControlName,
              obscureText: obscureText,
              keyboardType: textInputType,
              suffixIcon: iconData,
              iconColor: Color(0xff808194),
              iconSize: 16.sp,
              onPressed: onPressed,
              validationMessages: validationMessages,
              enabled: enabled,
            ),
          ),
        ),
      ],
    );
  }
}

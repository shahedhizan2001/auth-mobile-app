import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../state/auth_bloc.dart';
import '../widget/image_auth.dart';
import '../widget/text_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is RegisterSuccess) {
          Fluttertoast.showToast(
            msg: "Register Successed",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orangeAccent,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
        if (state is RegisterFailure) {
          Fluttertoast.showToast(
            msg: "Failed to register",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xffDC3545),
            textColor: Colors.white,
            fontSize: 16.0,
          );
          print(state.toString());
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: ReactiveForm(
              formGroup: context.read<AuthBloc>().register,
              child: ListView(children: [
                ImageAuth(),
                const RPadding(
                  padding:
                      EdgeInsets.only(top: 25, bottom: 22, left: 24, right: 24),
                  child: Center(
                    child: Text(
                      "Create new account",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Color(0xff2A2B2E)),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldWidget(
                            text: "Username",
                            iconData: Icons.cancel_outlined,
                            textInputType: TextInputType.name,
                            formControlName: 'username',
                            validationMessages: {
                              ValidationMessage.required: (error) => "Required",
                            },
                            onPressed: () {
                              context
                                  .read<AuthBloc>()
                                  .register
                                  .control('username')
                                  .reset();
                            },
                          ),
                          TextFieldWidget(
                            text: "Email",
                            iconData: Icons.cancel_outlined,
                            textInputType: TextInputType.emailAddress,
                            formControlName: 'email',
                            validationMessages: {
                              ValidationMessage.email: (error) =>
                                  "you enter invalid email",
                              ValidationMessage.required: (error) => "Required",
                            },
                            onPressed: () {
                              context
                                  .read<AuthBloc>()
                                  .register
                                  .control('email')
                                  .reset();
                            },
                          ),
                          TextFieldWidget(
                            text: "Password",
                            iconData: Icons.visibility_off,
                            obscureText: true,
                            textInputType: TextInputType.text,
                            formControlName: 'password',
                            validationMessages: {
                              ValidationMessage.required: (error) => "Required",
                              ValidationMessage.minLength: (error) =>
                                  "should be long than 8 character",
                            },
                          ),
                        ])),
                RPadding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Row(
                              children: [
                                Theme(
                                  data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2)),
                                    side: BorderSide(
                                        color: Color(0xff808194),
                                        width: 1.5.sp),
                                  )),
                                  child: Checkbox(
                                    value: context.read<AuthBloc>().isChecked,
                                    onChanged: (value) {
                                      context.read<AuthBloc>().add(
                                          ChangeCheckBox(isChecked: value!));
                                    },
                                  ),
                                ),
                                SizedBox(width: 0.w),
                                Text(
                                  "Remember me",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xff4F90F0),
                                decorationThickness: 1.5.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                RSizedBox(
                  height: 12,
                ),
                RPadding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(RegisterAuth());
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(345.w, 44.h)),
                      ),
                      RSizedBox(
                        height: 22,
                      ),
                      Row(
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff2A2B2E)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'Login', (route) => false);
                            },
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff2A2B2E),
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xff4F90F0),
                                decorationThickness: 1.5.sp,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}

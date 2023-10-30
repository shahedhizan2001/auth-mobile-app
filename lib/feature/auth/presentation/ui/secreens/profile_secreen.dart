import 'package:auth/commen/service/storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../state/auth_bloc.dart';
import '../widget/image_auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    context.read<AuthBloc>().add(GetUser());
    super.initState();
  }

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is GetUserSuccess) {
          usernameController.text = state.user.username!;
          emailController.text = state.user.email!;
          genderController.text=state.user.gender.toString();
          genderController.text = state.user.gender.toString()=="Gender.male"?"male":"female";
          print(state.user.gender);
          return SafeArea(
            child: Scaffold(
              body: ListView(
                children: [
                  ImageAuth(),
                  RPadding(
                    padding: EdgeInsets.only(
                        top: 25, bottom: 22, left: 24, right: 24),
                    child: Center(
                      child: Text(
                        '${state.user.firstName} ${state.user.lastName}'!,
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
                        InformationUser(
                            controller: usernameController, text: "Username"),
                        InformationUser(
                            controller: emailController, text: "Email"),
                        InformationUser(
                            controller: genderController, text: "Gender"),
                        RSizedBox(
                          height: 22,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            StorageService.clearUser().then((value) {
                              StorageService.setIsChecked(false);
                              context.read<AuthBloc>().add(DeleteUser());
                              return Navigator.pushNamedAndRemoveUntil(
                                  context, 'Login', (route) => false);
                            });
                          },
                          child: Text(
                            "Log out",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(345.w, 44.h),
                              backgroundColor: Color(0xffDC3545)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is GetUserLoading) {
          return ColoredBox(
            color: Colors.white,
          );
        } else
          return SizedBox();
      },
    );
  }
}

class InformationUser extends StatelessWidget {
  const InformationUser(
      {super.key, required this.controller, required this.text});

  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RPadding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff808194),
            ),
          ),
        ),
        RPadding(
          padding: const EdgeInsets.only(bottom: 22),
          child: SizedBox(
            height: 44,
            child: TextFormField(
              controller: controller,
              enabled: false,
              style: TextStyle(fontSize: 14.sp, color: Color(0xff2A2B2E)),
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      width: 0.5.sp,
                      color: Color(0xff808194),
                    )),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    REdgeInsets.symmetric(horizontal: 8, vertical: 13.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

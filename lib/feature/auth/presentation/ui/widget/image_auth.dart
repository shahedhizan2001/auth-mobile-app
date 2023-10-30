import 'package:auth/commen/service/storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../state/auth_bloc.dart';

class ImageAuth extends StatelessWidget {
  const ImageAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RSizedBox(
      height: 248,
      child: Stack(
        children: [
          Positioned(
              child: Padding(
            padding: EdgeInsets.only(left: 2.7, right: 1.57),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                "assets/images/Frame 645.jpg",
                width: double.infinity,
                height: 199.h,
                fit: BoxFit.cover,
              ),
            ),
          )),
          Positioned(
              top: 132.h,
              left: 139.w,
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is GetUserSuccess && state.user.token == null) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: ColoredBox(
                        color: Colors.white,
                        child: Image.network(
                          state.user.image != null
                              ? state.user.image!
                              : "https://encrypted-tbn0.gstatic.com/images?q="
                                  "tbn:ANd9GcSQJxKGGpPc9-5g25KWwnsCCy9O_dlS4HWo5A&usqp=CAU",
                          height: 116.h,
                          width: 116.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  } else {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset(
                        "assets/images/Rectangle 1136.jpg",
                        height: 116.h,
                        width: 116.w,
                        fit: BoxFit.cover,
                      ),
                    );
                  }
                },
              )),
        ],
      ),
    );
  }
}

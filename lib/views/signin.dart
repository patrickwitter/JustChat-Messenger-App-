import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messengerapp/viewmodel/signin_viewmodel.dart';
import 'package:messengerapp/views/baseview.dart';
import 'package:messengerapp/widgets/action_button.dart';
import 'package:sizer/sizer.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SignInViewModel>(builder: ((context, model) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/walkthroughLight.svg",
                      width: 100.w,
                      height: 50.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(4.w, 4.h, 4.w, 0),
                  child: Center(
                    child: Text(
                      "Connect easily with\nyour family and friends over countries",
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        "Terms & Privacy Policy",
                        style: TextStyle(fontSize: 10.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: ActionButton(
                    buttonText: "Start Messaging",
                    ontap: () {
                      model.signIn();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      ;
    }));
  }
}

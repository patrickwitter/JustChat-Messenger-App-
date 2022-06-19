import 'package:flutter/material.dart';
import 'package:messengerapp/viewmodel/signin_viewmodel.dart';
import 'package:messengerapp/views/baseview.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SignInViewModel>(builder: ((context, model) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Messenger Clone"),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              model.signIn();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Color(0xffDB4437),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Sign In with Google",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ),
      );
      ;
    }));
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// This is a reusable widget whose purpose on the UI is prompt the user
/// to do an action such as "Continue"
/// See image example   https://www.figma.com/file/WVoJLRkSEhMLxNDvxShQpB/Untitled?node-id=2%3A940
class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    this.backgroundColor,
    this.textColor,
    this.buttonshape,
    this.buttonStyle,
    this.padding,
    required this.buttonText,
    required this.ontap,
  }) : super(key: key);

  // This is the colour of the button. You would pass Colors.white for example.
  final Color? backgroundColor;

  final Color? textColor;

  final EdgeInsets? padding;

  final String buttonText;

  final TextStyle? buttonStyle;

  final Function ontap;

  final OutlinedBorder? buttonshape;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return TextButton(
      onPressed: () {
        ontap();
      },
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 2.h,
          ),
          backgroundColor: backgroundColor ?? const Color(0xff002DE3),
          primary: textColor ?? theme.primaryColor,
          shape: buttonshape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              )),
      child: Text(
        buttonText,
        style: buttonStyle ??
            TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

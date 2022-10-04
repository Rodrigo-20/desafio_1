import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String? text;
  Color textColor;
  IconData? iconData;
  String? iconPath;
  Color? iconColor;
  Color? backgroundColor;
  Color? borderColor;
  Function()? onTap;
  bool isEnabled;
  double padding;
  ButtonStyle? buttonStyle;

  CustomButton(
      {Key? key, this.text, this.iconData, this.iconPath,this.iconColor, this.backgroundColor = Colors.blue,
        this.borderColor, this.onTap, this.isEnabled = true, this.textColor = Colors
          .white, this.padding = 8.0}) : super(key: key) {
    iconColor ??= textColor;
    borderColor ??= backgroundColor;
    buttonStyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 8,
      side: BorderSide(color: borderColor!, width: 2),
      primary: backgroundColor,
      padding: EdgeInsets.all(2),
      minimumSize:Size.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: isEnabled ? onTap??=(){} : null,
        style: buttonStyle,
        child: Padding(
          padding: EdgeInsets.only(left: padding,right: padding, top: 6, bottom: 6) ,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _icon(iconData, iconPath, iconColor!),
              _separator(),
              _text(text, textColor),
            ],
          ),
        ));
  }

  _icon(IconData? iconData, String? iconPath, Color iconColor) {
    return iconData == null
        ? iconPath == null
        ? const SizedBox()
        : ImageIcon(AssetImage(iconPath), color: iconColor,)
        : Icon(iconData, color: iconColor,);
  }

  _separator() {
    if ((iconPath != null || iconData != null) && text != null) {
      return const SizedBox(width: 10,);
    }
    else {
      return const SizedBox();
    }
  }

  _text(String? text, Color textColor) {
    return text != null
        ? Text(text, style: TextStyle(color: textColor))
        : const SizedBox();
  }
}

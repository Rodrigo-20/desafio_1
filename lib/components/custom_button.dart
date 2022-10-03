import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String? text;
  Color textColor;
  Color? iconColor;
  Color? backgroundColor;
  Color? borderColor;
  IconData? iconData;
  String? iconPath;
  bool? isPrimary;
  Function()? onTap;
  bool isEnabled;
  ButtonStyle? buttonStyle;

  CustomButton(
      {Key? key, this.text, this.iconData, this.iconPath, this.backgroundColor, this.borderColor, this.isPrimary = true, this.onTap, this.isEnabled = true, this.textColor = Colors
          .white}) : super(key: key) {
    iconColor ??= textColor;
    borderColor ??= backgroundColor;
    buttonStyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      primary: backgroundColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: isEnabled ? onTap : null,
        style: buttonStyle,
        child: Padding(
          padding: const EdgeInsets.all(12),
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

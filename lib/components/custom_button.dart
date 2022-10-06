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
  EdgeInsets? padding;
  ButtonStyle? _buttonStyle;
  TextStyle? _textStyle;
  FontWeight fontWeight;
  double letterSpacing;


  CustomButton(
      {Key? key, this.text, this.iconData, this.iconPath,this.iconColor, this.backgroundColor = Colors.blue,
        this.borderColor, this.onTap, this.isEnabled = true, this.textColor = Colors
          .white, this.padding = const EdgeInsets.only(top: 6.0, bottom: 6.0, left: 8.0, right: 8.0), this.fontWeight = FontWeight.normal, this.letterSpacing = 2.0}) : super(key: key) {
    iconColor ??= textColor;
    borderColor ??= backgroundColor;
    _textStyle = TextStyle(color: textColor, fontWeight: fontWeight, letterSpacing: letterSpacing);
    _buttonStyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 8,
      side: BorderSide(color: isEnabled? borderColor!: Colors.transparent, width: 2),
      primary: backgroundColor,
      padding: padding,
      minimumSize:Size.zero,
      textStyle: _textStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: isEnabled ? onTap??=(){} : null,
        style: _buttonStyle,
        child: Padding(
          padding: padding!,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _icon(),
              _separator(),
              _text(),
            ],
          ),
        ));
  }

  _icon() {
    return iconData == null
        ? iconPath == null
        ? const SizedBox.shrink()
        : ImageIcon(AssetImage(iconPath!), color: iconColor,)
        : Icon(iconData, color: iconColor,);
  }

  _separator() {
    if ((iconPath != null || iconData != null) && text != null) {
      return const SizedBox(width: 10,);
    }
    else {
      return const SizedBox.shrink();
    }
  }

  _text() {
    return text != null
        ? Text(text!, style: _textStyle)
        : const SizedBox();
  }
}


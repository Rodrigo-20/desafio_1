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
  Function? onTap;
  bool isEnabled;
  EdgeInsets padding;
  TextStyle? textStyle;
  ButtonStyle? _buttonStyle;

  CustomButton(
      {Key? key,
        this.text,
        this.iconData,
        this.iconPath,
        this.iconColor,
        this.backgroundColor = Colors.blue,
        this.borderColor,
        this.onTap,
        this.isEnabled = true,
        this.textColor = Colors.white,
        this.padding = const EdgeInsets.only(left: 8,right:8, top: 6, bottom: 6),
        this.textStyle}) : super(key: key) {
    iconColor ??= textColor;
    borderColor ??= backgroundColor;

    if(textStyle == null ){
      textStyle = TextStyle(color: textColor);
    }
    else {
     textStyle =  TextStyle(color: textStyle!.color ?? textColor , fontWeight:textStyle!.fontWeight,fontStyle:textStyle!.fontStyle,letterSpacing: textStyle!.letterSpacing);
    }
    _buttonStyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 8,
      side:  BorderSide(color: isEnabled? borderColor!: Colors.transparent, width: 2),
      backgroundColor: backgroundColor,
      padding:const  EdgeInsets.all(2),
      minimumSize:Size.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: isEnabled ? onTap== null? ()=>{} : ()=>onTap!() : null,
        style: _buttonStyle,
        child: Padding(
          padding: padding,
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
        ? Text(text!, style: textStyle)
        : const SizedBox.shrink();
  }
}

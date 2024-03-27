import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle? style;
  final ShapeBorder? shape;

  const PlatformButton({super.key, 
    required this.text,
    required this.onPressed,
    this.style,
    this.shape,
  });

  factory PlatformButton.create(BuildContext context, {
    required String text,
    required VoidCallback onPressed,
    ButtonStyle? style,
    ShapeBorder? shape,
  }) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      return AndroidButton(
        text: text,
        onPressed: onPressed,
        style: style,
        shape: shape,
      );
    } else {
      return IOSButton(
        text: text,
        onPressed: onPressed,
        style: style,
        shape: shape,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformButton.create(
      context,
      text: text,
      onPressed: onPressed,
      style: style,
      shape: shape,
    );
  }
}

class AndroidButton extends PlatformButton {
  const AndroidButton({super.key, 
    required String text,
    required VoidCallback onPressed,
    ButtonStyle? style,
    ShapeBorder? shape,
  }) : super(
          text: text,
          onPressed: onPressed,
          style: style,
          shape: shape,
        );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Text(text),
    );
  }
}

class IOSButton extends PlatformButton {
  const IOSButton({super.key, 
    required String text,
    required VoidCallback onPressed,
    ButtonStyle? style,
    ShapeBorder? shape,
  }) : super(
          text: text,
          onPressed: onPressed,
          style: style,
          shape: shape,
        );

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(8.0),
      color: CupertinoColors.systemBlue,
      child: Text(text),
    );
  }
}
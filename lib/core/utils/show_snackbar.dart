import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context,
  String content,
  Color? backgroundColor,
) {
  ScaffoldMessenger.of(context)
    ..hideCurrentMaterialBanner()
    ..showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: backgroundColor,
    ));
}

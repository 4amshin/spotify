import 'package:flutter/material.dart';
import 'package:spotify/core/utils/build_context_ext.dart';

class AuthBottomLinkText extends StatelessWidget {
  final String text;
  final String linkText;
  final Widget navigateTo;
  const AuthBottomLinkText({
    super.key,
    required this.text,
    required this.linkText,
    required this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () => context.pushReplacement(navigateTo),
            child: Text(linkText),
          )
        ],
      ),
    );
  }
}

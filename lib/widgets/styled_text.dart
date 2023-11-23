import 'package:flutter/material.dart';
import 'package:resume_creater/extensions/responsive.dart';

class StyledText extends StatelessWidget {
  const StyledText({super.key, required this.text, this.color});
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      text,
      style: TextStyle(
        fontSize: context.width(20),
        color: color,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

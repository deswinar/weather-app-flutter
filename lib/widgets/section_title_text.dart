import 'package:flutter/material.dart';

class SectionTitleText extends StatelessWidget {
  final String text;
  const SectionTitleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleMedium,);
  }
}
import 'package:flutter/material.dart';
// import 'package:seo_renderer/seo_renderer.dart';

class SEOText extends StatelessWidget {
  const SEOText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    // this.textRendererStyle,
  });
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  // final TextRendererStyle? textRendererStyle;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: style, textAlign: textAlign);
  }
}

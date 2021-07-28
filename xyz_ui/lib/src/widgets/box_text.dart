import 'package:xyz_ui/src/shared/app_colors.dart';
import 'package:xyz_ui/src/shared/styles.dart';
import 'package:flutter/material.dart';

class BoxText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign alignment;
  final TextOverflow overflow = TextOverflow.visible;

  const BoxText.headingOne(this.text, {TextAlign align = TextAlign.start})
      : style = heading1Style,
        alignment = align;
  const BoxText.headingThree(this.text, {TextAlign align = TextAlign.start})
      : style = heading3Style,
        alignment = align;
  const BoxText.headline(this.text, {TextAlign align = TextAlign.start})
      : style = headlineStyle,
        alignment = align;
  const BoxText.caption(this.text, {TextAlign align = TextAlign.start})
      : style = captionStyle,
        alignment = align;

  BoxText.headingTwo(this.text,
      {TextAlign align = TextAlign.start, color = Colors.black})
      : style = heading2Style.copyWith(color: color),
        alignment = align;

  BoxText.subheading(
    this.text, {
    TextAlign align = TextAlign.start,
    color = Colors.black,
    fontWeight = FontWeight.normal,
  })  : style = subheadingStyle.copyWith(color: color, fontWeight: fontWeight),
        alignment = align;

  BoxText.body(this.text,
      {Color color = kcMediumGreyColor, TextAlign align = TextAlign.start})
      : style = bodyStyle.copyWith(color: color),
        alignment = align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: alignment,
      overflow: overflow,
    );
  }
}

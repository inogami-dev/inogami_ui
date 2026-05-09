import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final double fontSize;

  /// Note: if [maxLines] does not work as expected, try wrapping the [MyText] widget with an [Expanded] widget.
  final int maxLines;
  final TextOverflow textOverFlow;
  final FontWeight fontWeight;
  final Color? color;

  const MyText({
    super.key,
    required this.text,
    this.fontSize = kDefaultFontSize,
    this.maxLines = 1,
    this.textOverFlow = TextOverflow.clip,
    this.fontWeight = FontWeight.w400,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // final currentColorTheme = ref.watch(myAppThemeStateProvider);
    final myColorScheme = Theme.of(context).colorScheme;

    return Text(
      text,
      softWrap: (maxLines > 1) ? true : false,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        overflow: (maxLines > 1)
            ? TextOverflow.ellipsis
            : textOverFlow, // to be observed pa
        color: color ?? myColorScheme.onSurface,
      ),
    );
  }
}

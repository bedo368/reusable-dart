import 'package:flutter/material.dart';

// Custom widget to display text with a "Read more" option
class ReadMoreText extends StatefulWidget {
  final String text; // The text to be displayed
  final int maxLines; // Maximum number of lines to display before truncating
  final TextStyle? style; // Style for the text
  final TextStyle? readmeStyle; // Style for the "Read more" text

  // Constructor
  const ReadMoreText({
    Key? key,
    required this.text,
    this.maxLines = 2, // Default to 2 lines before truncating
    this.style = const TextStyle(), // Default to an empty text style
    this.readmeStyle = const TextStyle(), // Default to an empty text style
  }) : super(key: key);

  @override
  createState() => _ReadMoreTextState(); // Create state for the widget
}

// State class for ReadMoreText widget
class _ReadMoreTextState extends State<ReadMoreText> {
  bool _isExpanded = false; // Flag to track if text is expanded

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            widget.text, // Display the text
            style: widget.style, // Apply the specified text style
            softWrap: true,
            textAlign: TextAlign.start,
            overflow:
                _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            maxLines: _isExpanded
                ? null
                : widget.maxLines, // Truncate text if not expanded
          ),
        ),
        // Display "Read more" option if text exceeds maximum lines
        if ((_getNumberOfLines(context, widget.text, widget.style!) >
            widget.maxLines))
          Transform.translate(
            offset: Offset(
                !_isExpanded
                    ? 0
                    : -MediaQuery.of(context).size.width +
                        95 +
                        MediaQuery.of(context).size.width * .045,
                !_isExpanded ? -20 : 0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded; // Toggle text expansion
                  });
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 5),
                  color: Colors.white,
                  child: Text(
                    _isExpanded
                        ? 'Read less'
                        : '... Read more', // Display appropriate text based on expansion state
                    style: widget.readmeStyle, // Apply the specified style
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// Function to calculate the number of lines in the text
int _getNumberOfLines(
    BuildContext context, String textCalc, TextStyle textStyle) {
  // Create a TextPainter object
  final textPainter = TextPainter(
    text: TextSpan(
        text: textCalc,
        style: textStyle), // Use the same text style as your Text widget
    maxLines: 999, // A very high number of lines
    textDirection: TextDirection.ltr,
  );

  // Layout the text
  textPainter.layout(maxWidth: MediaQuery.of(context).size.width);

  // Return the actual number of lines
  return textPainter.computeLineMetrics().length;
}

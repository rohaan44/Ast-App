import 'package:flutter/material.dart';

/// A custom widget that draws a horizontal dotted line.
class DottedDivider extends StatelessWidget {
  final Color color;
  final double height;
  final double dashWidth;
  final double spaceWidth;

  const DottedDivider({
    Key? key,
    this.color = Colors.white54,
    this.height = 1.0,
    this.dashWidth = 5.0,
    this.spaceWidth = 5.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        
        // Calculate the total width of one dash + one space cycle
        final double dashAndSpace = dashWidth + spaceWidth;
        
        // Calculate how many cycles fit in the available width
        final int dashCount = (boxWidth / dashAndSpace).floor();
        
        return CustomPaint(
          size: Size(boxWidth, height),
          painter: _DottedLinePainter(
            color: color,
            dashWidth: dashWidth,
            spaceWidth: spaceWidth,
            dashCount: dashCount,
          ),
        );
      },
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double spaceWidth;
  final int dashCount;

  _DottedLinePainter({
    required this.color,
    required this.dashWidth,
    required this.spaceWidth,
    required this.dashCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.height
      ..strokeCap = StrokeCap.round; // Use round caps for smoother dots

    // Start drawing from the left (x=0)
    double currentX = 0;

    for (int i = 0; i < dashCount; i++) {
      // 1. Draw the dash (dot)
      // Line from currentX to currentX + dashWidth. Since height is usually 1.0, 
      // this looks like a horizontal dash/dot.
      canvas.drawLine(
        Offset(currentX, 0),
        Offset(currentX + dashWidth, 0),
        paint,
      );
      
      // 2. Move to the start of the next dash
      // Advance by the dash width and the space width
      currentX += dashWidth + spaceWidth;
    }
  }

  @override
  bool shouldRepaint(covariant _DottedLinePainter oldDelegate) {
    // Repaint only if properties that affect the line have changed
    return oldDelegate.color != color ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.spaceWidth != spaceWidth;
  }
}
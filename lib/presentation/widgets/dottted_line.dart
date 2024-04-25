
import 'package:flutter/material.dart';

class HorizontalDottedLinePainter extends CustomPainter {
  late final Color color;
  HorizontalDottedLinePainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.square;

    const double dashWidth = 2;
    const double dashSpace = 10;
    double startX = 0;

    while (startX < size.width) {


      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
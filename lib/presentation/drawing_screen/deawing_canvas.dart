import 'dart:ui';

import 'package:flutter/material.dart';

class DrawingCanvas extends StatefulWidget {
  const DrawingCanvas({Key? key}) : super(key: key);

  @override
  _DrawingCanvasState createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  final List<Offset> _points = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            RenderBox? object = (context.findRenderObject() as RenderBox);
            Offset _localPosition =
                object.globalToLocal(details.globalPosition);
            _points.add(_localPosition);
          });
        },
        onPanEnd: (details) {
          setState(() {});
        },
        child: CustomPaint(
          painter: Signature(points: _points),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class Signature extends CustomPainter {
  List<Offset> points;
  Paint pointer = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5.0;
  Path path = Path();

  Signature({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) {
      return;
    }
    canvas.drawPoints(PointMode.lines, points, pointer);
  }

  @override
  bool shouldRepaint(covariant Signature oldDelegate) {
    return oldDelegate.points.length <= points.length;
  }
}

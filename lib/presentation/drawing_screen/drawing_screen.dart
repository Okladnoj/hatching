import 'package:flutter/material.dart';
import 'package:hatching/core/logger/logger.dart';

import 'deawing_canvas.dart';
import 'drawing_buttons_row.dart';

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({Key? key}) : super(key: key);

  @override
  _DrawingScreenState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Container(
          color: Colors.white,
          child: const DrawingCanvas(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: DrawingButtonsRow(
              canExit: false,
              onConfirm: () => Logger.m("confirm"),
              onCancel: () => Logger.m("cancel"),
              onRestart: () => Logger.m("restart"),
            ),
          ),
        )
      ],
    ));
  }
}

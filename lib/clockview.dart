import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      const  SizedBox(height: 10,),
        SizedBox(
          height: 190,
          width: 300,
          child: Center(
            child: CustomPaint(
              painter: ClockShape(color: Theme.of(context).colorScheme.primary),
              child:  SizedBox(
                width: 200,
                height: 200,
                child: Center(
                  child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(children: [
                            TextSpan(
                              text: '28',
                              style: TextStyle(
                                fontSize: 22,
                                color: Theme.of(context).colorScheme.secondary,
                                // fontWeight: FontWeight.w500,
                              ),
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.top,
                              child: Baseline(
                                baseline: 0.0,
                                baselineType: TextBaseline.alphabetic,
                                child: Text(
                                  'o',
                                  style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary ,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            TextSpan(
                              text: 'C\n',
                              style: TextStyle(
                                fontSize: 22,
                                 color: Theme.of(context).colorScheme.secondary,
                                // fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'Celicious',
                              style: TextStyle(
                                fontSize: 8,
                                 color: Theme.of(context).colorScheme.secondary,
                                // fontWeight: FontWeight.w500,
                              ),
                            ),
                          ]),
                        ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ClockShape extends CustomPainter {
  final Color color;

  ClockShape({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    var centerx = size.width / 2;
    var centery = size.height / 2;
    var center = Offset(centerx, centery);
    var radius = min(centerx, centery);

    // First blue outline
    var firstBlueOutline = Paint()
      ..color =color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;
    // Second blue outline
    var secondBlueOutline = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    // Gray outline
    var grayOutline = Paint()
      ..color =color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;

    // Draw first blue outline
    canvas.drawCircle(center, radius - 35, firstBlueOutline);

    // Draw second blue outline
    canvas.drawCircle(center, radius - 50, secondBlueOutline);

    var innerCircleRadius = radius -10; // Adjust this value to increase/decrease height
    var outerCircleRadius = radius ; // Adjust this value to increase/decrease height
    var numLines = 360 ~/ 12; // Number of lines to draw
    var angleIncrement = 2 * pi / numLines; // Angle between each line

    // Draw dashed lines along the circumference
    for (var i = 0; i < numLines; i++) {
      var angle = i * angleIncrement;
      var x1 = centerx + outerCircleRadius * cos(angle);
      var y1 = centery + outerCircleRadius * sin(angle);
      var x2 = centerx + innerCircleRadius * cos(angle);
      var y2 = centery + innerCircleRadius * sin(angle);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), grayOutline);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
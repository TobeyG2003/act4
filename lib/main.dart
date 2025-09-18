import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const ShapesDemoApp());
}

class ShapesDemoApp extends StatelessWidget {
  const ShapesDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shapes Drawing Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ShapesDemoScreen(),
    );
  }
}

class ShapesDemoScreen extends StatelessWidget {
  const ShapesDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Shapes Drawing Demo'),
        ),
        body: SingleChildScrollView(
padding: const EdgeInsets.all(16.0),
child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Task 1: Basic Shapes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: CustomPaint(
                painter: BasicShapesPainter(),
                size: const Size(double.infinity, 200),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Task 2: Emojis',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: CustomPaint(
                painter: SmileyPainter(),
                size: const Size(double.infinity, 300),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Task 3: Interactive Emoji Drawing',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
              child: TabBar(
                tabs: [ Tab(text: 'Smiley'),
                Tab(text: 'Heart'),
                Tab(text: 'Party'),
                Tab(text: 'to do'),
              ],
            ),
            ),
            const SizedBox(height: 200,
            child: Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('Home Content')),
                  Center(child: Text('Settings Content')),
                  Center(child: Text('Profile Content')),
                  Center(child: Text('Profile Content')),
                ],
              ),
            )
            ),
          ],
        ),
      ),
    )
    );
  }
}

class BasicShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Determine the center of the canvas
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final squareOffset = Offset(centerX - 80, centerY);
    final circleOffset = Offset(centerX, centerY);
    final arcOffset = Offset(centerX + 80, centerY);
    final rectOffset = Offset(centerX - 160, centerY);
    final lineStart = Offset(centerX - 200, centerY - 50);
    final lineEnd = Offset(centerX - 140, centerY + 50);
    final ovalOffset = Offset(centerX + 160, centerY);

    // Draw a square
    final squarePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(center: squareOffset, width: 60, height: 60),
      squarePaint,
    );

    // Draw a circle
    final circlePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawCircle(circleOffset, 30, circlePaint);

    // Draw an arc
    final arcPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawArc(
      Rect.fromCenter(center: arcOffset, width: 60, height: 60),
      0, // start angle in radians
      2.1, // sweep angle in radians (about 120 degrees)
      false, // whether to use center
      arcPaint,
    );

    // Draw a rectangle
    final rectPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(center: rectOffset, width: 80, height: 40),
      rectPaint,
    );

    // Draw a line
    final linePaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 3;
    canvas.drawLine(lineStart, lineEnd, linePaint);

    // Draw an oval
    final ovalPaint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(center: ovalOffset, width: 80, height: 40),
      ovalPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SmileyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Background gradient
    final backgroundGradient = RadialGradient(
      center: Alignment.center,
      radius: 0.8,
      colors: [Colors.yellow, Colors.orange],
    );
    // Background gradient
    final facePaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(centerX, centerY),
      150,
      facePaint
    );

    final eyePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset (centerX - 50, centerY - 30), 15, eyePaint);
    canvas.drawCircle(Offset (centerX + 50, centerY - 30), 15, eyePaint);
    final mouthPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawArc(

      Rect.fromCenter(center: Offset(centerX, centerY + 20), width: 100, height: 60),
      0,
      pi/2,
      false,
      mouthPaint,
    );
    
    /*final roofPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    final roofPath = Path()
      ..moveTo(centerX - 60, centerY)
      ..lineTo(centerX + 60, centerY)
      ..lineTo(centerX, centerY - 60)
      ..close();
    canvas.drawPath(roofPath, roofPaint);
    */
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class StyledShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Draw a gradient-filled rectangle
    final rectGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Colors.red, Colors.blue],
    );
    final rect = Rect.fromCenter(center: Offset(centerX, centerY - 100), width: 200, height: 60);
    canvas.drawRect(
      rect,
      Paint()
        ..shader = rectGradient.createShader(rect)
        ..style = PaintingStyle.fill,
    );

    // Draw a circle with a border
    final circlePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    final circleBorderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawCircle(Offset(centerX - 80, centerY), 40, circlePaint);
    canvas.drawCircle(Offset(centerX - 80, centerY), 40, circleBorderPaint);

    // Draw a transparent oval
    final ovalPaint = Paint()
      ..color = Colors.purple.withOpacity(0.5)
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(center: Offset(centerX + 80, centerY), width: 100, height: 60),
      ovalPaint,
    );

    // Draw a dashed line using a custom path effect
    final dashPaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    
    // We draw a series of short lines and spaces
    final path = Path();
    double startX = centerX - 100;
    const dashLength = 10.0;
    const spaceLength = 5.0;
    while (startX < centerX + 100) {
      path.moveTo(startX, centerY + 80);
      path.lineTo(min(startX + dashLength, centerX + 100), centerY + 80);
      startX += dashLength + spaceLength;
    }
    canvas.drawPath(path, dashPaint);

    // Draw a gradient arc
    final arcGradient = SweepGradient(
      center: Alignment.centerRight,
      startAngle: 0,
      endAngle: pi, // Use pi from dart:math
      colors: [Colors.red, Colors.yellow, Colors.green],
    );
    final arcRect = Rect.fromCenter(center: Offset(centerX, centerY + 100), width: 120, height: 120);
    final arcPaint = Paint()
      ..shader = arcGradient.createShader(arcRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCenter(center: Offset(centerX, centerY + 100), width: 100, height: 100),
      0, // start angle
      2.5, // sweep angle
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

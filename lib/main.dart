import 'package:flutter/material.dart';
import 'dart:math';
// Tobey Gray
// Harshith Boopathy
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
              'Task 2: Smile Emoji',
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
                Tab(text: 'Skull'),
                Tab(text: 'Party'),
                Tab(text: 'Heart'),
              ],
            ),
            ),
            SizedBox(height: 500,
            child: Expanded(
              child: TabBarView(
                children: [
                  Center(
              child: CustomPaint(
                painter: SmileyPainter(),
                size: const Size(double.infinity, 300),
              ),
            ),
                  Center(
              child: CustomPaint(
                painter: SkullPainter(),
                size: const Size(double.infinity, 300),
              ),
            ),
                  Center(
              child: CustomPaint(
                painter: PartyHatEmojiPainter(),
                size: const Size(double.infinity, 300),
              ),
            ),
                  Center(
              child: CustomPaint(
                painter: HeartOnlyPainter(),
                size: const Size(double.infinity, 300),
              ),
            ),
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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SkullPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Background gradient
    final backgroundGradient = RadialGradient(
      center: Alignment.center,
      radius: 0.8,
      colors: [const Color.fromARGB(255, 255, 255, 255), const Color.fromARGB(255, 36, 36, 36)],
    );

    canvas.drawRect(
Rect.fromLTWH(0, 0, size.width, size.height),
Paint()..shader = backgroundGradient.createShader(Rect.fromLTWH(0, 0,
size.width, size.height)),
);

    // Background gradient
    final facePaint = Paint()
      ..color = const Color.fromARGB(255, 195, 195, 195)
      ..style = PaintingStyle.fill;
    final Rect rect = Rect.fromCenter(
      center: Offset(centerX, centerY-20),
      width: 300,
      height: 250,
    );
    canvas.drawOval(
      rect,
      facePaint
    );

    final eyePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset (centerX - 50, centerY - 30), 30, eyePaint);
    canvas.drawCircle(Offset (centerX + 50, centerY - 30), 30, eyePaint);

    final teethPaint = Paint()
      ..color = const Color.fromARGB(255, 195, 195, 195)
      ..style = PaintingStyle.fill;
    final Rect teethrect1 = Rect.fromCenter(
      center: Offset(centerX+40, centerY+90),
      width: 70,
      height: 100,
    );
    final Rect teethrect2 = Rect.fromCenter(
      center: Offset(centerX-40, centerY+90),
      width: 70,
      height: 100,
    );
    final Rect teethrect3 = Rect.fromCenter(
      center: Offset(centerX, centerY+90),
      width: 70,
      height: 100,
    );
    canvas.drawOval(teethrect1, teethPaint);
    canvas.drawOval(teethrect2, teethPaint);
    canvas.drawOval(teethrect3, teethPaint);

    final nosePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    final path = Path();
    path.moveTo(size.width / 2, centerY+10);
    path.lineTo(centerX+25, centerY+40);
    path.lineTo(centerX-25, centerY+40);
    path.close();

    canvas.drawPath(path, nosePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


class HeartOnlyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    final w = min(size.width, size.height) * 0.60;
    final h = w;

    final bottom = Offset(cx, cy + h * 0.30);
    final topDip = Offset(cx, cy - h * 0.10);

    final path = Path()
      ..moveTo(bottom.dx, bottom.dy)
      ..cubicTo(
        cx + w * 0.50, cy + h * 0.05,
        cx + w * 0.50, cy - h * 0.35,
        topDip.dx, topDip.dy,
      )
      ..cubicTo(
        cx - w * 0.50, cy - h * 0.35,
        cx - w * 0.50, cy + h * 0.05,
        bottom.dx, bottom.dy,
      )
      ..close();

    final rect = Rect.fromCenter(center: Offset(cx, cy), width: w, height: h);
    final fill = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFF5A7A), Color(0xFFD41445)],
      ).createShader(rect);

    final stroke = Paint()
      ..color = const Color(0xFF8E1C2A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = max(2.0, w * 0.03)
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, fill);
    canvas.drawPath(path, stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


class PartyHatEmojiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < 200; i++) {
      final confettiPaint = Paint()
      ..color = Colors.primaries[Random().nextInt(Colors.primaries.length)]
      ..style = PaintingStyle.fill;
      final rect = Rect.fromLTWH(
        Random().nextDouble() * size.width,
        Random().nextDouble() * size.height,
        5,
        10,
      );
       canvas.rotate(Random().nextDouble() * 2 * pi);
      canvas.drawRect(rect, confettiPaint);
    }
    canvas.restore();
    final c = Offset(size.width * 0.5, size.height * 0.58);
    final r = min(size.width, size.height) * 0.28;

    _drawFace(canvas, c, r);
    _drawHat(canvas, c, r); 
  }

  void _drawFace(Canvas canvas, Offset c, double r) {
    canvas.drawCircle(c, r, Paint()..color = const Color(0xFFF7E64A));

    final eyeOffX = r * 0.35;
    final eyeOffY = r * 0.18;
    final eyePaint = Paint()..color = Colors.black;
    canvas.drawCircle(Offset(c.dx - eyeOffX, c.dy - eyeOffY), r * 0.09, eyePaint);
    canvas.drawCircle(Offset(c.dx + eyeOffX, c.dy - eyeOffY), r * 0.09, eyePaint);

    final mouthRect = Rect.fromCenter(
      center: Offset(c.dx + r * 0.03, c.dy + r * 0.20),
      width: r * 1.05,
      height: r * 0.95,
    );
    final smile = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = max(4.0, r * 0.06)
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(mouthRect, 0.12 * pi, 0.55 * pi, false, smile);
  }

  void _drawHat(Canvas canvas, Offset c, double r) {
  final baseY = c.dy - r - r * 0.02;    
  final hatWidth = r * 1.20;            
  final hatHeight = r * 0.95;    

  final hatLeft  = Offset(c.dx - hatWidth / 2, baseY);
  final hatRight = Offset(c.dx + hatWidth / 2, baseY);
  final hatTop   = Offset(c.dx, baseY - hatHeight);

  final hatPath = Path()
    ..moveTo(hatTop.dx, hatTop.dy)
    ..lineTo(hatLeft.dx, hatLeft.dy)
    ..lineTo(hatRight.dx, hatRight.dy)
    ..close();

  canvas.drawPath(hatPath, Paint()..color = const Color(0xFF7C3AED)); 

  final stripePaint = Paint()
    ..color = const Color(0xFFFFD54F) 
    ..strokeWidth = r * 0.06
    ..style = PaintingStyle.stroke;

  double lerp(double a, double b, double t) => a + (b - a) * t;

  for (int i = -2; i <= 2; i++) {
    final t = i / 2.5;
    final p1 = Offset(lerp(hatLeft.dx, hatTop.dx, (t + 1) / 2),
                      lerp(hatLeft.dy, hatTop.dy, (t + 1) / 2));
    final p2 = Offset(lerp(hatRight.dx, hatTop.dx, (1 - t) / 2),
                      lerp(hatRight.dy, hatTop.dy, (1 - t) / 2));
    canvas.drawLine(p1, p2, stripePaint);
  }

  canvas.drawCircle(hatTop, r * 0.10, Paint()..color = const Color(0xFFFF4D4D));
}


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

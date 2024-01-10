import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class Utils {
  void toastMessage(String message) {
    // Fluttertoast.showToast(
    //   msg: message,
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.BOTTOM,
    //   timeInSecForIosWeb: 1,
    //   backgroundColor: Colors.red,
    //   textColor: Colors.white,
    //   fontSize: 16.0
    // );
  }
  static void fieldFoucs(
      BuildContext context, FocusNode currentNode, FocusNode nextFocus) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toasstMessage(String message) {
    // Fluttertoast.showToast(
    //     msg: message,
    //     backgroundColor: Colors.black12,
    //     textColor: Colors.white,
    //   fontSize: 14
    // );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.black,
    textColor: Colors.white,
  );
}

class RadialProgressUtil extends StatelessWidget {
  final double goalCompleted;
  final Color progressColor;

  RadialProgressUtil(
      {required this.goalCompleted, required this.progressColor});

  @override
  Widget build(BuildContext context) {
    return RadialProgress_micro_cal(
      goalCompleted: goalCompleted,
      progressColor: progressColor,
    );
  }
}

class RadialProgress_micro_cal extends StatefulWidget {
  final double goalCompleted;
  final Color progressColor;

  RadialProgress_micro_cal(
      {required this.goalCompleted, required this.progressColor});

  @override
  _RadialProgress_micro_calState createState() =>
      _RadialProgress_micro_calState();
}

class _RadialProgress_micro_calState extends State<RadialProgress_micro_cal>
    with SingleTickerProviderStateMixin {
  late AnimationController _radialProgressAnimationController;
  late Animation<double> _progressAnimation;
  final Duration fadeInDuration = Duration(milliseconds: 500);
  final Duration fillDuration = Duration(seconds: 2);

  double progressDegrees = 0;

  @override
  void initState() {
    super.initState();
    _radialProgressAnimationController =
        AnimationController(vsync: this, duration: fillDuration);
    _progressAnimation = Tween(begin: 0.0, end: 360.0).animate(CurvedAnimation(
        parent: _radialProgressAnimationController, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {
          progressDegrees = widget.goalCompleted * _progressAnimation.value;
        });
      });

    _radialProgressAnimationController.forward();
  }

  @override
  void dispose() {
    _radialProgressAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        alignment: Alignment.center,
        height: 45.0,
        width: 45.0,
        child: AnimatedOpacity(
          opacity: progressDegrees > 30 ? 1.0 : 0.0,
          duration: fadeInDuration,
          child: Text(
            // '${(progressDegrees / 360 * 100).toInt()}%',
            "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      painter: RadialPainter(progressDegrees, widget.progressColor),
    );
  }
}

class RadialPainter extends CustomPainter {
  double progressInDegrees;
  Color progressColor;

  RadialPainter(this.progressInDegrees, this.progressColor);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black26
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0;

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);

    Paint progressPaint = Paint()
      ..color = progressColor
      ..shader = LinearGradient(colors: [
        Colors.lightBlueAccent,
        Colors.blue.shade500,
        Colors.blue.shade300
      ]).createShader(Rect.fromCircle(center: center, radius: size.width / 2))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: size.width / 2),
      math.radians(-90),
      math.radians(progressInDegrees),
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

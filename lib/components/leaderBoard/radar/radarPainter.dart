import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learning_people/Utils/style.dart';
import 'package:learning_people/bloc/screen/radarBloc.dart';

class RadarPainter extends CustomPainter {
  final Map maps;
  final Color mainAxisColor;
  final Color gridAxisColor;
  final double maxValue;
  final double steps;
  final RadarBloc bloc;
  final double radiusPadding;

  RadarPainter(this.maps,
      {this.mainAxisColor,
      this.gridAxisColor,
      this.maxValue = 8,
      this.steps = 2,
      this.radiusPadding = 10,
      this.bloc,
      Key key})
      : assert(maps != null);
  @override
  void paint(Canvas canvas, Size size) {
    final anglePerSide = 360 / this.maps.length;
    final radius = min(size.width, size.height) / 2;

    final gridAxisPaint = Paint()
      ..color = webDashColor
      ..strokeWidth = 1
      ..strokeJoin = StrokeJoin.bevel;

    double paddedRadius = radius - radiusPadding;
    //  Draw grid
    for (var i = steps; i <= maxValue; i += steps) {
      var radiusPartial = i / maxValue;
      Offset initialOffset, fromOffset;
      initialOffset = fromOffset = _getOffset(
          0, anglePerSide, paddedRadius * radiusPartial,
          maxRadius: radius);
      // draw grid axis
      for (var j = 1; j < this.maps.length; j++) {
        var toOffset = _getOffset(j, anglePerSide, paddedRadius * radiusPartial,
            maxRadius: radius);
        canvas.drawLine(fromOffset, toOffset, gridAxisPaint);
        fromOffset = toOffset;
      }
      canvas.drawLine(fromOffset, initialOffset, gridAxisPaint);
    }
    final mainAxisPaint = Paint()
      ..color = primaryColor
      ..strokeWidth = 3;
    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(size.width / 2, size.height / 2);
    // draw primary axis
    for (var i = 0; i < this.maps.length; i++) {
      canvas.drawLine(
          center,
          _getOffset(i, anglePerSide, radius),
          mainAxisPaint);
    }

    var sideNo = 0;
    var path = Path();
    Offset firstPath;
    List<Alignment> alignmentList = [];
    for (var key in maps.keys) {
      var radiusPartial = maps[key] / maxValue;
      Offset current = _getOffset(
          sideNo++, anglePerSide, paddedRadius * radiusPartial,
          maxRadius: radius);
      alignmentList.add(Alignment((current.dx - center.dx) / center.dx,
          (current.dy - center.dy) / center.dy));
      if (sideNo == 1) {
        firstPath = current;
        path.moveTo(current.dx, current.dy);
      } else {
        path.lineTo(current.dx, current.dy);
      }
    }

    bloc.alignmentList.sink.add(alignmentList);
    path.lineTo(firstPath.dx, firstPath.dy);
    final polygonPaint = Paint()..color = Colors.grey.withOpacity(0.3);
    canvas.drawPath(path, polygonPaint);
  }

  @override
  bool shouldRepaint(CustomPainter old) => old != this;

  Offset _getOffset(int sizeNo, double angle, double radius,
      {double maxRadius}) {
    final rotationAwareAngle = sizeNo * angle - 90;
    maxRadius = maxRadius ?? radius;

    final radian = _angleToRadian(rotationAwareAngle);
    final x = cos(radian) * radius + maxRadius;
    final y = sin(radian) * radius + maxRadius;
    return Offset(x, y);
  }

  double _angleToRadian(double angle) => angle * (pi / 180);
}

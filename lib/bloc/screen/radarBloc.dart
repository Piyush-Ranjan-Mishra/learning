import 'dart:async';

import 'package:flutter/material.dart';

class RadarBloc {
  RadarBloc._();
  static RadarBloc get instance => RadarBloc._();

  StreamController alignmentList =
      StreamController<List<Alignment>>.broadcast();
  
  void dispose() {
    alignmentList.close();
  }
}

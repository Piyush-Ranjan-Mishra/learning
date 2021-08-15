import 'package:flutter/painting.dart';
import 'package:learning_people/Utils/style.dart';

//! Margin
const EdgeInsets marginBottom12 = EdgeInsets.only(bottom: 12);
const EdgeInsets marginBottom40 = EdgeInsets.only(bottom: 40);
const EdgeInsets marginCards = EdgeInsets.all(10);

// const EdgeInsets marginCards = EdgeInsets.all(10);

// Padding
const EdgeInsets paddingAll10Bottom30 = EdgeInsets.fromLTRB(10, 10, 10, 30);
const EdgeInsets paddingStudentProfileCards = EdgeInsets.all(10);
const EdgeInsets paddingYourTargetCards = EdgeInsets.all(10);

// const EdgeInsets paddingCards = EdgeInsets.all(10);
const double notificationIconSize = 44;
const double radarLabelRadius = 10;
const double recommendationIconSize = 44;
const double sizeBetweenWidget = 20;

//textStyle
TextStyle yellowTextStyle({double fontSize, FontWeight fontWeight = FontWeight.normal}) => 
  TextStyle(color: iconColor, fontSize: fontSize, fontWeight: fontWeight);
TextStyle blueTextStyle({double fontSize, FontWeight fontWeight = FontWeight.normal}) => 
  TextStyle(color: primaryColor, fontSize: fontSize, fontWeight: fontWeight);


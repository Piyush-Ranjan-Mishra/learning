import 'package:flutter/material.dart';
import 'package:learning_people/Utils/commonWidgets.dart';
import 'package:learning_people/Utils/spacing.dart';
import 'package:learning_people/Utils/style.dart';

import 'radar/radar.dart';

class LeaderBoard extends StatelessWidget {
  

  const LeaderBoard({ key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle normalText =
        Theme.of(context).textTheme.bodyText1.copyWith(color: titleColor);
    TextStyle highlightedText =
        Theme.of(context).textTheme.bodyText1.copyWith(color: iconColor);
    return Card(
      margin: marginCards,
      child: Container(
        padding:paddingAll10Bottom30,
        child: Column(
          children: [
            CardHeading('Your Leaderboard', Icons.star_border_outlined),
            Text.rich(
              TextSpan(
                text: 'You rank ',
                style: normalText,
                children: [
                  TextSpan(text: '3,527', style: highlightedText),
                  TextSpan(
                      text: ' of 4,513 enrolled students', style: normalText),
                ],
              ),
            ),
            ProgressBar(
              3527 / 4513,
            ),
            Row(
              children: [
                Text(
                  'Cadence Level',
                  style: normalText,
                ),
                Spacer(),
                Text('1 of 10'),
              ],
            ),
            ProgressBar(1 / 10),
            Radar({
              'Module Test Score': 10,
              'Learning Assets': 10,
              'Total Duration Learning Each Week': 4,
              'Total Assesment Set': 2,
              'Attempts': 1
            }),
          ],
        ),
      ),
    );
  }
}

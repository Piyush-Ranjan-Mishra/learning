import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_people/Utils/commonWidgets.dart';

void main() {
  testWidgets('HeadingTable Test with Background', (WidgetTester tester) async {
    await tester.pumpWidget(TabularData('Title', 'Subtitle', isAlternateBackGroundNeeded: true,));

    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Subtitle'), findsOneWidget);
    expect(
        (tester.firstWidget(find.byKey(Key('headingTableBackground')))
                as Container)
            .color,
        Color(0xFFE3FFC7));
  });
}

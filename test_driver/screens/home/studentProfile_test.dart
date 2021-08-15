import 'package:flutter_test/flutter_test.dart';
import 'package:learning_people/components/studentProfile.dart';

void main() {
  testWidgets('Student Profile Test', (WidgetTester tester) async {
    await tester.pumpWidget(StudentProfile({
      'Name': 'TestName',
      'Learning People Id': '007007',
      'First Enrolled': '27 January 2020',
      'Current Course/Collection': 'CEO for Dummies',
      'star': 3,
    }));

    expect(find.text('Name'), findsOneWidget);
    expect(find.text('TestName'), findsOneWidget);
    expect(find.text('Learning People Id'), findsOneWidget);
    expect(find.text('007007'), findsOneWidget);
    expect(find.text('First Enrolled'), findsOneWidget);
    expect(find.text('27 January 2020'), findsOneWidget);
    expect(find.text('Current Course/Collection'), findsOneWidget);
    expect(find.text('CEO for Dummies'), findsOneWidget);
    expect(find.text('Tips to level up'), findsOneWidget);
  });
}

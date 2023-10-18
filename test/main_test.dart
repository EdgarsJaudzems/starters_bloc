import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nock/nock.dart';
import 'package:http/http.dart' as http;
import 'package:starters_bloc/constants/strings.dart';
import 'package:starters_bloc/main.dart';

void main() {
  setUpAll(nock.init);

  setUp(() {
    nock.cleanAll();
  });
  testWidgets('Check if app has correct title', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle(const Duration(seconds: 2));

    var title = find.text(kAppTitle);
    expect(title, findsOneWidget);
  });

  testWidgets('Check if tabbar is rendered correctly', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle(const Duration(seconds: 2));

    var first = find.byIcon(Icons.set_meal);
    expect(first, findsOneWidget);

    var second = find.byIcon(Icons.store);
    expect(second, findsOneWidget);
  });

  testWidgets('Should tap on second tab and see correct text', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle(const Duration(seconds: 2));

    var second = find.byIcon(Icons.store);
    expect(second, findsOneWidget);

    await tester.tap(second);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.text(kNoOrders), findsOneWidget);
  });

  testWidgets('Should test widget with http call', (WidgetTester tester) async {
    final interceptor = nock('https://seanallen-course-backend.herokuapp.com')
        .get('/swiftui-fundamentals/appetizers')
      ..reply(200, "request");

    final response = await http.get(Uri.parse(
        "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"));

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(interceptor.isDone, true);
    expect(response.statusCode, 200);
    expect(response.body, "request");
  });
}

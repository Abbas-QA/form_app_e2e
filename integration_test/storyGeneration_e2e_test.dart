import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:form_app/main.dart';

void main() {
  var faker = new Faker();
  var fakeFirstName = faker.person.firstName();
  var fakerLastName = faker.person.lastName();
  var email2 = fakeFirstName + fakerLastName + '@dormzi.com';

  group('Testing App Performance Tests', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
        as IntegrationTestWidgetsFlutterBinding;

    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    testWidgets('Story Creation with person + interesting', (tester) async {
      await tester.pumpWidget(FormApp());

      await tester.tap(find.text('Validation'));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final adjectiveOfText =
          find.widgetWithText(TextFormField, 'Enter an adjective');
      final nounOfText = find.widgetWithText(TextFormField, 'Enter a noun');
      final agreeTermsOfService = find.byType(Checkbox);
      final submitButton = find.byType(TextButton);

      const adjectiveOfTextSet = 'interesting';
      const nounOfTextSet = 'person';

      await tester.tap(adjectiveOfText);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(adjectiveOfText, adjectiveOfTextSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(nounOfText);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(nounOfText, nounOfTextSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(agreeTermsOfService);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(submitButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.text('Your story'), findsOneWidget);
    });
    testWidgets('Story Creation with quick + place', (tester) async {
      await tester.pumpWidget(FormApp());

      await tester.tap(find.text('Validation'));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final adjectiveOfText =
          find.widgetWithText(TextFormField, 'Enter an adjective');
      final nounOfText = find.widgetWithText(TextFormField, 'Enter a noun');
      final agreeTermsOfService = find.byType(Checkbox);
      final submitButton = find.byType(TextButton);

      const adjectiveOfTextSet = 'interesting';
      const nounOfTextSet = 'person';

      await tester.tap(adjectiveOfText);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(adjectiveOfText, adjectiveOfTextSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(nounOfText);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(nounOfText, nounOfTextSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(agreeTermsOfService);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(submitButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.text('Your story'), findsOneWidget);
    });

    testWidgets('Story Creation with beautiful + thing', (tester) async {
      await tester.pumpWidget(FormApp());

      await tester.tap(find.text('Validation'));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final adjectiveOfText =
          find.widgetWithText(TextFormField, 'Enter an adjective');
      final nounOfText = find.widgetWithText(TextFormField, 'Enter a noun');
      final agreeTermsOfService = find.byType(Checkbox);
      final submitButton = find.byType(TextButton);

      const adjectiveOfTextSet = 'interesting';
      const nounOfTextSet = 'person';

      await tester.tap(adjectiveOfText);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(adjectiveOfText, adjectiveOfTextSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(nounOfText);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(nounOfText, nounOfTextSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(agreeTermsOfService);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(submitButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.text('Your story'), findsOneWidget);
    });
  });
}
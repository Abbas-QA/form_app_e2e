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
  var fakePass = faker.internet.password(length: 8);

  group('Testing App Performance Tests', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
        as IntegrationTestWidgetsFlutterBinding;

    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    testWidgets('Sign in test with valid credentials', (tester) async {
      await tester.pumpWidget(FormApp());

      await tester.tap(find.text('Sign in with HTTP'));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final email = find.widgetWithText(TextFormField, 'Email');
      final pass = find.widgetWithText(TextFormField, 'Password');
      final signInBtn = find.widgetWithText(TextButton, 'Sign in');
      const emailSet = 'root';
      const passwordSet = 'password';

      await tester.tap(email);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(email, emailSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(pass);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(pass, passwordSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(signInBtn);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.text('Successfully signed in.'), findsOneWidget);
    });

    testWidgets('Sign in test with invalid credentials', (tester) async {
      await tester.pumpWidget(FormApp());

      await tester.tap(find.text('Sign in with HTTP'));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final email = find.widgetWithText(TextFormField, 'Email');
      final pass = find.widgetWithText(TextFormField, 'Password');
      final signInBtn = find.widgetWithText(TextButton, 'Sign in');
      var emailSet = email2;
      var passwordSet = fakePass;

      await tester.tap(email);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(email, emailSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(pass);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(pass, passwordSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(signInBtn);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.text('Unable to sign in.'), findsOneWidget);
    });
  });
}

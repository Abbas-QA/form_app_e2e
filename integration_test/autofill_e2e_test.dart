import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:form_app/main.dart';

void main() {
  var faker = new Faker();
  var fakeFirstName = faker.person.firstName();
  var fakerLastName = faker.person.lastName();
  var fakerEmail = faker.internet.email();
  var email2 = fakeFirstName + fakerLastName + '@dormzi.com';

  group('Testing App Performance Tests', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
        as IntegrationTestWidgetsFlutterBinding;

    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    testWidgets('Autofill with Dormzi email', (tester) async {
      await tester.pumpWidget(FormApp());

      await tester.tap(find.text('Autofill'));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final firstName = find.widgetWithText(TextFormField, 'First Name');
      final lastName = find.widgetWithText(TextFormField, 'Last Name');
      final email = find.widgetWithText(TextField, 'Email');
      final telephone = find.widgetWithText(TextField, 'Telephone');
      final streetAddress = find.widgetWithText(TextField, 'Street Address');
      final postalCode = find.widgetWithText(TextField, 'Postal Code');
      final country = find.widgetWithText(TextField, 'Country');
      final countryCode = find.widgetWithText(TextField, 'Country Code');

      var firstNameSet = fakeFirstName;
      var lastNameSet = fakerLastName;
      var emailSet = email2;
      const telephoneSet = '(425) 2793156';
      var streetAdressSet = '3020';
      const postalCodeSet = '98005';
      const countrySet = 'USA';
      const countryCodeSet = '+1';

      await tester.tap(firstName);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(firstName, firstNameSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(lastName);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(lastName, lastNameSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(email);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(email, emailSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(telephone);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(telephone, telephoneSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(streetAddress);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(streetAddress, streetAdressSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(postalCode);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(postalCode, postalCodeSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(country);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(country, countrySet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(countryCode);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Autofill without Dormzi Email', (tester) async {
      await tester.pumpWidget(FormApp());

      await tester.tap(find.text('Autofill'));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final firstName = find.widgetWithText(TextFormField, 'First Name');
      final lastName = find.widgetWithText(TextFormField, 'Last Name');
      final email = find.widgetWithText(TextField, 'Email');
      final telephone = find.widgetWithText(TextField, 'Telephone');
      final streetAddress = find.widgetWithText(TextField, 'Street Address');
      final postalCode = find.widgetWithText(TextField, 'Postal Code');
      final country = find.widgetWithText(TextField, 'Country');
      final countryCode = find.widgetWithText(TextField, 'Country Code');

      var firstNameSet = fakeFirstName;
      var lastNameSet = fakerLastName;
      var emailSet = fakerEmail;
      const telephoneSet = '(425) 2793156';
      const streetAdressSet = '3020';
      const postalCodeSet = '98005';
      const countrySet = 'USA';
      const countryCodeSet = '+1';

      await tester.tap(firstName);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(firstName, firstNameSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(lastName);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(lastName, lastNameSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(email);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(email, emailSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(telephone);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(telephone, telephoneSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(streetAddress);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(streetAddress, streetAdressSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(postalCode);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(postalCode, postalCodeSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(country);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(country, countrySet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(countryCode);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.text('1'), findsOneWidget);
    });
  });
}

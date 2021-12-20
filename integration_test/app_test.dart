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
  var fakeEmail = faker.internet.email();
  var fakerPhone = faker.phoneNumber;
  group('Testing App Performance Tests', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
        as IntegrationTestWidgetsFlutterBinding;

    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    // testWidgets('Scrolling test', (tester) async {
    //   await tester.pumpWidget(FormApp());

    //   final listFinder = find.byType(ListView);

    //   await binding.watchPerformance(() async {
    //     await tester.fling(listFinder, const Offset(0, -500), 10000);
    //     await tester.pumpAndSettle();

    //     await tester.fling(listFinder, const Offset(0, 500), 10000);
    //     await tester.pumpAndSettle();
    //   }, reportKey: 'scrolling_summary');
    // });

    // testWidgets('Sign in test', (tester) async {
    //   await tester.pumpWidget(FormApp());

    //   await tester.tap(find.text('Sign in with HTTP'));
    //   await tester.pumpAndSettle(const Duration(seconds: 1));
    //   // expect(find.text('Sign in Form'), findsOneWidget);

    //   final email = find.widgetWithText(TextFormField, 'Email');
    //   final pass = find.widgetWithText(TextFormField, 'Password');
    //   final signInBtn = find.widgetWithText(TextButton, 'Sign in');
    //   const emailSet = 'root';
    //   const passwordSet = 'password';

    //   await tester.tap(email);
    //   await tester.pumpAndSettle(const Duration(seconds: 1));
    //   await tester.enterText(email, emailSet);
    //   await tester.pumpAndSettle(const Duration(seconds: 1));
    //   await tester.tap(pass);
    //   await tester.pumpAndSettle(const Duration(seconds: 1));
    //   await tester.enterText(pass, passwordSet);
    //   await tester.pumpAndSettle(const Duration(seconds: 1));
    //   await tester.tap(signInBtn);
    //   await tester.pumpAndSettle(const Duration(seconds: 1));

    //   expect(find.text('Successfully signed in.'), findsOneWidget);
    // });

    testWidgets('Autofill', (tester) async {
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

    testWidgets('Form widgets', (tester) async {
      await tester.pumpWidget(FormApp());

      await tester.tap(find.text('Form widgets'));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final formTitle = find.widgetWithText(TextFormField, 'Title');
      final formDescription = find.widgetWithText(TextFormField, 'Description');
      //final dateEditButton = find.widgetWithText(TextButton, 'Edit');
      final brushTeethCheckBox = find.byType(Checkbox);

      const formTitleSet = 'Hello World';
      const formDescriptionSet = 'Should be the long text....';

      await tester.tap(formTitle);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(formTitle, formTitleSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(formDescription);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(formDescription, formDescriptionSet);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(brushTeethCheckBox);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(brushTeethCheckBox, findsOneWidget);
    });

    testWidgets('Story Creation', (tester) async {
      await tester.pumpWidget(FormApp());

      await tester.tap(find.text('Validation'));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final adjectiveOfText =
          find.widgetWithText(TextFormField, 'Enter an adjective');
      final nounOfText = find.widgetWithText(TextFormField, 'Enter a noun');
      //final dateEditButton = find.widgetWithText(TextButton, 'Edit');
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

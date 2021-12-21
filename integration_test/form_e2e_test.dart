import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:form_app/main.dart';

void main() {
  group('Testing App Performance Tests', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
        as IntegrationTestWidgetsFlutterBinding;

    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

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
  });
}

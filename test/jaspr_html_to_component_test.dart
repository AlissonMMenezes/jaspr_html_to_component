import 'package:jaspr_html_to_component/jaspr_html_to_component.dart';
import 'package:jaspr_test/jaspr_test.dart';

void main() {
  group('Testing Convertion HTML to Component', () {
    testComponents('Testing Hello World Paragraph', (tester) async {
      String htmlString = '<div><p>Hello, World!</p></div>';
      await tester.pumpComponent(HtmlToComponent(htmlString));

      expect(find.tag("div"), findsOneComponent);
      expect(find.tag("p"), findsOneComponent);
      expect(find.text("Hello, World!"), findsOneComponent);
    });
  });
}

import 'package:jaspr/jaspr.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as html_parser;

/// Checks if you are awesome. Spoiler: you are.
Component convertHtmlToComponent(dom.Node node) {
  if (node is dom.Element) {
    return DomComponent(
      tag: node.localName ?? 'div',
      classes: node.classes.isNotEmpty ? node.classes.toList().join(' ') : null,
      attributes: node.attributes.isNotEmpty
          ? Map<String, String>.from(node.attributes)
          : null,
      children: node.nodes
          .map(convertHtmlToComponent)
          .whereType<Component>()
          .toList(),
    );
  } else if (node is dom.Text) {
    return Text(node.text);
  }
  return DomComponent(tag: 'div'); // Fallback to a default component
}

class HtmlToComponent extends StatelessComponent {
  final String htmlString;

  HtmlToComponent(this.htmlString);

  @override
  Iterable<Component> build(BuildContext context) sync* {
    var document = html_parser.parse(htmlString);
    var body = document.body;

    if (body != null) {
      yield convertHtmlToComponent(body);
    }
  }
}

# jaspr_html_to_component

Simple dart package that converts HTML strings into **[Jaspr]**(https://github.com/schultek/jaspr) Components

## Setup
To get started, add the package as a dev dependency to your project:

dart pub add jaspr_html_to_component

## Usage

```
import 'dart:convert';

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_html_to_component/jaspr_html_to_component.dart'

@client
class Page extends StatelessComponent {
  
  @override
  Iterable<Component> build(BuildContext context) sync* {
    
    var test = "<bold><a href='/'>Hello World!</a></bold>";
    yield HtmlToComponent(test);

    }
        
}

Component convertHtmlToComponent(dom.Node node) {
  print("Conerting html to component");
  print(node);
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


```

Thanks for using it =)
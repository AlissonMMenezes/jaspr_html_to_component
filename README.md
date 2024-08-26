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
```

Thanks for using it =)
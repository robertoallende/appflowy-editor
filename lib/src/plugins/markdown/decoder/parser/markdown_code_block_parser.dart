import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:markdown/markdown.dart' as md;

class MarkdownCodeBlockParserV2 extends CustomMarkdownParser {
  const MarkdownCodeBlockParserV2();

  @override
  List<Node> transform(
    md.Node element,
    List<CustomMarkdownParser> parsers, {
    MarkdownListType listType = MarkdownListType.unknown,
    int? startNumber,
  }) {
    if (element is! md.Element) return [];
    if (element.tag != 'pre') return [];

    final codeElement = element.children
        ?.whereType<md.Element>()
        .where((e) => e.tag == 'code')
        .firstOrNull;

    if (codeElement == null) return [];

    final text = codeElement.textContent;
    final language = _extractLanguage(codeElement);

    return [
      Node(
        type: 'code',
        attributes: {
          'language': language,
          'delta': (Delta()..insert(text)).toJson(),
        },
      ),
    ];
  }

  static String _extractLanguage(md.Element element) {
    final className = element.attributes['class'] ?? '';
    if (className.startsWith('language-')) {
      return className.substring('language-'.length);
    }
    return '';
  }
}

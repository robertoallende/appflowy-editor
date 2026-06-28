# Unit 02: Code Block Component

## Objective

Add support for rendering and editing fenced code blocks (` ``` `) in the editor. Previously, code blocks were parsed during encoding but had no visual component, so they were invisible in the editor.

## Changes

### Decoder — `markdown_code_block_parser.dart`

New `MarkdownCodeBlockParserV2` handles `<pre><code>` HTML elements from the markdown parser, extracting text content and language attribute into a `'code'` type node with a delta.

### Component — `code_block_component.dart`

New `CodeBlockComponentBuilder` and `CodeBlockComponentWidget`:
- Renders code in a monospace font (13px) inside a rounded container with `surfaceContainerHigh` background
- Full editing support via `AppFlowyRichText` with proper selectable mixins
- Adapts to light/dark theme

### Registration

- Added to `standardBlockComponentBuilderMap` 
- Added to `markdownToDocument` default parser list
- Exported from `block_component.dart` and `parser.dart` barrel files

## Files

- `lib/src/editor/block_component/code_block_component/code_block_component.dart` — new
- `lib/src/plugins/markdown/decoder/parser/markdown_code_block_parser.dart` — new
- `lib/src/plugins/markdown/document_markdown.dart` — registered parser
- `lib/src/editor/block_component/standard_block_components.dart` — registered builder
- `lib/src/editor/block_component/block_component.dart` — export
- `lib/src/plugins/markdown/decoder/parser/parser.dart` — export

## Status: Complete

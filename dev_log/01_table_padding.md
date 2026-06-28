# Unit 01: Table Cell Padding Fix

## Objective

Remove uneven vertical padding in table cells. The original implementation added a hardcoded `+8` to the calculated row height, causing more space at the bottom than the top of each cell.

## Changes

### table_node.dart — Remove hardcoded +8

`updateRowHeight()` calculated max row height by adding 8px to each cell's rendered paragraph height. This extra space appeared as bottom padding since the cell content is top-aligned in a `Column`.

```dart
// Before
.map<double>((c) => c[row].children.first.rect.height + 8)

// After
.map<double>((c) => c[row].children.first.rect.height)
```

### table_cell_block_component.dart — Symmetric cell padding

The cell content `Padding` only had horizontal padding. Added `vertical: 4` to give equal spacing top and bottom.

```dart
// Before
padding: const EdgeInsets.symmetric(horizontal: 4),

// After
padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
```

## Files

- `lib/src/editor/block_component/table_block_component/table_node.dart`
- `lib/src/editor/block_component/table_block_component/table_cell_block_component.dart`

## Status: Complete

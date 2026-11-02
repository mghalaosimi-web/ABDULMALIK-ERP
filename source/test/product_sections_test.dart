import 'package:flutter_test/flutter_test.dart';

import 'package:abdulmalik_erp/src/core/product_sections.dart';

void main() {
  group('accessory product categories', () {
    test('stores accessory categories with an internal namespace', () {
      expect(storedAccessoriesCategory('سماعات'), 'الأكسسوارات::سماعات');
    });

    test('recognizes and displays accessory categories without the namespace', () {
      const stored = 'الأكسسوارات::حماية الشاشة';
      expect(isAccessoriesCategory(stored), isTrue);
      expect(visibleProductCategory(stored), 'حماية الشاشة');
    });

    test('does not classify regular inventory categories as accessories', () {
      expect(isAccessoriesCategory('قطع غيار'), isFalse);
      expect(visibleProductCategory('قطع غيار'), 'قطع غيار');
      expect(isAccessoriesCategory(null), isFalse);
    });
  });
}

const accessoriesCategoryPrefix = 'الأكسسوارات::';

const accessoriesCategories = <String>[
  'أغطية وحافظات',
  'سماعات',
  'شواحن',
  'كابلات',
  'حماية الشاشة',
  'حوامل',
  'بطاقات ذاكرة',
  'بطاريات وقطع',
  'أخرى',
];

bool isAccessoriesCategory(String? value) =>
    value != null && value.startsWith(accessoriesCategoryPrefix);

String visibleProductCategory(String? value) {
  if (isAccessoriesCategory(value)) {
    return value!.substring(accessoriesCategoryPrefix.length);
  }
  return value ?? '';
}

String storedAccessoriesCategory(String value) =>
    '$accessoriesCategoryPrefix${value.trim()}';

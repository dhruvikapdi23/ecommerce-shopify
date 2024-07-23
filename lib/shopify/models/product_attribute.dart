import 'dart:developer';


class ProductAttribute {
  String? id;
  String? name;
  String? label;
  String? slug;
  List? options = [];
  List optionSlugs = [];
  bool? isVisible;
  bool? isVariation;

  String? get cleanSlug => slug?.replaceAll('pa_', '');
  bool? isDefault;
  bool? isActive = false;

  /// For BigCommerce.
  String? type;

  ProductAttribute({
    this.id,
    this.name,
    this.label,
    this.slug,
    this.options,
    this.optionSlugs = const [],
    this.isVisible,
    this.isVariation,
    this.isDefault,
    this.isActive,
    this.type,
  });

  ProductAttribute.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'].toString();
    label = parsedJson['label'] ?? parsedJson['name']?.replaceAll('pa_', '');
    name = parsedJson['name']?.replaceAll('pa_', '');

    slug = parsedJson['slug'].toString().toLowerCase();
    isVariation = parsedJson['variation'] ?? false;
    isVisible = parsedJson['visible'] ?? false;
    isDefault = parsedJson['default'] ?? false;
    if (parsedJson['options'] != null) {
      for (var item in parsedJson['options']) {
        options!.add(item);
      }
    }
    if (parsedJson['slugs'] != null) {
      for (var item in parsedJson['slugs']) {
        optionSlugs.add(item);
      }
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'label': label,
      'options': options,
      'slugs': optionSlugs,
      'visible': isVisible,
      'variation': isVariation,
      'isActive': isActive,
      'default': isDefault,
      'slug': slug,
    };
  }

  ProductAttribute.fromLocalJson(Map<String, dynamic> json) {
    try {
      id = json['id']?.toString();
      name = json['name'];
      options = json['options'];
      label = name;
    } catch (e) {
      log(e.toString());
    }
  }

  ProductAttribute.fromShopify(att) {
    try {
      id = att['id'];
      name = att['name'];
      label = name;
      List? values = att['values'];
      if (values != null) {
        options = values;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  ProductAttribute copyWith({
    String? id,
    String? name,
    String? label,
    String? slug,
    List? options,
    List? optionSlugs,
    bool? isVisible,
    bool? isVariation,
    bool? isDefault,
    bool? isActive,
  }) {
    return ProductAttribute(
      id: id ?? this.id,
      name: name ?? this.name,
      label: label ?? this.label,
      slug: slug ?? this.slug,
      options: options ?? this.options,
      optionSlugs: optionSlugs ?? this.optionSlugs,
      isVisible: isVisible ?? this.isVisible,
      isVariation: isVariation ?? this.isVariation,
      isDefault: isDefault ?? this.isDefault,
      isActive: isActive ?? this.isActive,
    );
  }
}

class Attribute {
  int? id;
  String? name;
  String? option;

  /// For BigCommerce.
  String? optionLabel;

  Attribute({
    this.id,
    this.name,
    this.option,
    this.optionLabel,
  });

  Attribute.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['name'];
    option = parsedJson['option'];
  }

  Attribute.fromMagentoJson(Map<String, dynamic> parsedJson) {
    id = int.parse(parsedJson['value']);
    name = parsedJson['attribute_code'];
    option = parsedJson['value'];
  }

  Attribute.fromLocalJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['name'];
    option = parsedJson['option'];
  }

  Attribute.fromShopifyJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['name'];
    option = parsedJson['value'];
  }

  Attribute.fromPrestaJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['name'];
    option = parsedJson['option'];
  }

  Attribute.fromBigCommerceJson(Map<String, dynamic> json) {
    id = json['id'];
    name = '${json['option_id']}';
    option = json['label'];
    optionLabel = json['option_display_name'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'option': option};
  }

  @override
  String toString() {
    return '${name ?? ""}${option ?? ""}';
  }
}

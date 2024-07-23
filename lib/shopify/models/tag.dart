import 'dart:convert';
import 'dart:developer';


class Tag {
  int? id;
  String? name;
  String? slug;
  String? description;
  int? count;

  Tag({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.count,
  });

  Tag.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      name = json['name'];
      slug = json['slug'];
      description = json['description'];
      count = json['count'];
    } catch (e, trace) {
      log(e.toString());
      log(trace.toString());
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['count'] = count;
    return data;
  }

  @override
  String toString() => 'Tag ${jsonEncode(toJson())}';
}

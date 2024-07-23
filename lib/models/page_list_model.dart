import '../config.dart';

class PageListModel {
  String? title;
  String? desc;
  List<PageList>? pageList;

  PageListModel({this.title, this.desc, this.pageList});

  PageListModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    if (json['pageList'] != null) {
      pageList = <PageList>[];
      json['pageList'].forEach((v) {
        pageList!.add(PageList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['desc'] = desc;
    if (pageList != null) {
      data['pageList'] = pageList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


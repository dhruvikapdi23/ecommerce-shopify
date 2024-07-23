class PageList {
  String? pageName;
  String? routeName;

  PageList({this.pageName,this.routeName});

  PageList.fromJson(Map<String, dynamic> json) {
    pageName = json['pageName'];
    routeName = json['routeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageName'] = pageName;
    data['routeName'] = routeName;
    return data;
  }
}
class Statistic {
  String? title;
  String? desc;
  String? image;
  double? count;

  Statistic({this.title, this.desc, this.image,this.count});

  Statistic.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    image = json['image'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['desc'] = desc;
    data['image'] = image;
    data['count'] = count;
    return data;
  }
}
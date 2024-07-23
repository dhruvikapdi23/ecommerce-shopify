import '../config.dart';

class AboutUsModel {
  String? title;
  String? desc1;
  String? desc2;
  List<Statistic>? statistic;
  String? desc3;
  String? ourBrand;

  AboutUsModel(
      {this.title,
        this.desc1,
        this.desc2,
        this.statistic,
        this.desc3,
        this.ourBrand});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc1 = json['desc1'];
    desc2 = json['desc2'];
    if (json['statistic'] != null) {
      statistic = <Statistic>[];
      json['statistic'].forEach((v) {
        statistic!.add(Statistic.fromJson(v));
      });
    }
    desc3 = json['desc3'];
    ourBrand = json['ourBrand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['desc1'] = desc1;
    data['desc2'] = desc2;
    if (statistic != null) {
      data['statistic'] = statistic!.map((v) => v.toJson()).toList();
    }
    data['desc3'] = desc3;
    data['ourBrand'] = ourBrand;
    return data;
  }
}


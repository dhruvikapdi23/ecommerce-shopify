

class TermsAndConditionModel {
  String? title;
  List<Description>? description;

  TermsAndConditionModel({this.title, this.description});

  TermsAndConditionModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['description'] != null) {
      description = <Description>[];
      json['description'].forEach((v) {
        description!.add(Description.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (description != null) {
      data['description'] = description!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Description {
  String? title;
  List<SubTitle>? subTitle;
  Description({this.title,this.subTitle});

  Description.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['description'] != null) {
      subTitle = <SubTitle>[];
      json['subTitle'].forEach((v) {
        subTitle!.add(SubTitle.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (subTitle != null) {
      data['subTitle'] = subTitle!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubTitle {
  String? title;

  SubTitle({this.title});

  SubTitle.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    return data;
  }
}
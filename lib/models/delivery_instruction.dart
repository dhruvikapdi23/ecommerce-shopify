class DeliveryInstructionModel {
  String? title;
  String? icon;

  DeliveryInstructionModel({this.title, this.icon});

  DeliveryInstructionModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['icon'] = icon;
    return data;
  }
}

class DeliveryChargesInstruction {
  String? title;
  String? icon;

  DeliveryChargesInstruction({this.title, this.icon});

  DeliveryChargesInstruction.fromJson(Map<String, dynamic> json) {
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
class NotificationModel {
  int? categoryId;
  String? title;
  String? date;
  String? image;
  bool? isRead;

  NotificationModel(
      {this.categoryId, this.title, this.date, this.image, this.isRead});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    title = json['title'];
    date = json['date'];
    image = json['image'];
    isRead = json['isRead'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    data['title'] = title;
    data['date'] = date;
    data['image'] = image;
    data['isRead'] = isRead;
    return data;
  }
}

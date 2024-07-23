class Reviews {
  String? name;
  String? description;
  String? date;
  String? image;
  double? rating;
  String? size;
  int? like;
  int? disLike;

  Reviews(
      {this.name,
        this.description,
        this.date,
        this.rating,
        this.size,
        this.like,
        this.disLike,this.image});

  Reviews.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    date = json['date'];
    rating = json['rating'];
    size = json['size'];
    like = json['like'];
    disLike = json['disLike'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['date'] = date;
    data['rating'] = rating;
    data['size'] = size;
    data['like'] = like;
    data['disLike'] = disLike;
    data['image'] = image;
    return data;
  }
}
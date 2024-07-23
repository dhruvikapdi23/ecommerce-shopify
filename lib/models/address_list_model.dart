class AddressList {
  String? name;
  String? address;
  String? addressType;
  String? locality;
  String? state;
  String? city;
  String? pinCode;
  String? phone;

  AddressList(
      {this.name,
        this.address,
        this.addressType,
        this.locality,
        this.state,
        this.city,
        this.pinCode,
        this.phone});

  AddressList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    addressType = json['addressType'];
    locality = json['locality'];
    state = json['state'];
    city = json['city'];
    pinCode = json['pinCode'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['addressType'] = addressType;
    data['locality'] = locality;
    data['state'] = state;
    data['city'] = city;
    data['pinCode'] = pinCode;
    data['phone'] = phone;
    return data;
  }
}
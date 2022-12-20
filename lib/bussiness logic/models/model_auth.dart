class UserModel {
  String? uid;
  String? gender;
  String? name;
  String? address;
  String? dop;
  int? phone;

  UserModel(
      {this.uid, this.gender, this.name, this.phone, this.dop, this.address});

//data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map["uid"],
      gender: map["gender"],
      name: map["name"],
      address: map["address"],
      dop: map["dop"],
      phone: map["phone"],
    );
  }

//seading data to our server
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "gender": gender,
      "name": name,
      "address": address,
      "dop": dop,
      "phone": phone,
    };
  }
}
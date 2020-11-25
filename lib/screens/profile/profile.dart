class Profile {
  int id;
  String name;
  String lastName;
  String address;
  String email;
  String password;
  String phoneNumber;
  int rol;

  Profile(
      {this.id,
      this.name,
      this.lastName,
      this.address,
      this.email,
      this.password,
      this.phoneNumber,
      this.rol});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['last_name'];
    address = json['address'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phone_number'];
    rol = json['rol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['last_name'] = this.lastName;
    data['address'] = this.address;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone_number'] = this.phoneNumber;
    data['rol'] = this.rol;
    return data;
  }
}

class ProfileResponse {
  final List<Profile> profile;
  final String error;

  ProfileResponse(this.profile, this.error);

  
  ProfileResponse.fromJson(Map<String, dynamic> json) : profile = (json["user"] as List).map((i) => new Profile.fromJson(i)).toList(),
  error = "";

  ProfileResponse.withError(String errorValue)
    : profile = List(),
    error = errorValue;
}
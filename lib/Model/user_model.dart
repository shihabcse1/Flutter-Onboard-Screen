class UserModel {
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  String? active;
  String? token;
  String? status;
  String? message;

  UserModel(
      {this.firstName,
        this.lastName,
        this.mobile,
        this.email,
        this.active,
        this.token,
        this.status,
        this.message
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    email = json['email'];
    active = json['active'];
    token = json['token'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['active'] = this.active;
    data['token'] = this.token;
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

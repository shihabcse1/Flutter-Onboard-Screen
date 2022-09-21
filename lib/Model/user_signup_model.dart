class UserModelSignUp {
  String? message;
  String? status;
  UserData? userData;

  UserModelSignUp({this.message, this.status, this.userData});

  UserModelSignUp.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
  String? firstName;
  String? mobile;
  String? email;
  String? status;

  UserData({this.firstName, this.mobile, this.email, this.status});

  UserData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    mobile = json['mobile'];
    email = json['email'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['status'] = this.status;
    return data;
  }
}

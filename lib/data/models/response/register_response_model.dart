import 'dart:convert';

class RegisterResponseModel {
    String? email;
    String? password;
    String? name;
    String? avatar;
    String? role;
    int? id;
    DateTime? creationAt;
    DateTime? creationDate;

    RegisterResponseModel({
        this.email,
        this.password,
        this.name,
        this.avatar,
        this.role,
        this.id,
        this.creationAt,
        this.creationDate,
    });

    factory RegisterResponseModel.fromJson(String str) => RegisterResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RegisterResponseModel.fromMap(Map<String, dynamic> json) => RegisterResponseModel(
        email: json["email"],
        password: json["password"],
        name: json["name"],
        avatar: json["avatar"],
        role: json["role"],
        id: json["id"],
        creationAt: json["creationAt"] == null ? null : DateTime.parse(json["creationAt"]),
        creationDate: json["creationDate"] == null ? null : DateTime.parse(json["creationDate"]),
    );

    Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
        "name": name,
        "avatar": avatar,
        "role": role,
        "id": id,
        "creationAt": creationAt?.toIso8601String(),
        "creationDate": creationDate?.toIso8601String(),
    };
}

import 'dart:convert';

Auth AuthFromJson(String str) => Auth.fromJson(json.decode(str));

String AuthToJson(Auth data) => json.encode(data.toJson());

class Auth {
    Auth({
        required this.email,
        required this.password,
        required this.remember
    });

    String email;
    String password;
    bool remember;

    factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        email: json["email"],
        password: json["password"],
        remember: json["remember"]
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "remember": remember
    };
}

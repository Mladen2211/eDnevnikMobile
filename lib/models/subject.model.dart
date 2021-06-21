import 'dart:convert';

Subject SubjectFromJson(String str) => Subject.fromJson(json.decode(str));

String SubjectToJson(Subject data) => json.encode(data.toJson());

class Subject {
    Subject({
        this.id,
        this.name,
        this.teachingProfessor,
        this.deleted,
        this.active,
    });

    int? id;
    String? name;
    int? teachingProfessor;
    bool? deleted;
    bool? active;

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["Id"],
        name: json["Name"],
        teachingProfessor: json["TeachingProfessor"],
        deleted: json["Deleted"],
        active: json["Active"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "teachingProfessor": teachingProfessor,
        "deleted": deleted,
        "active": active,
    };
}


// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) => GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) => json.encode(data.toJson());

class GetProfileModel {
    String? status;
    Data? data;

    GetProfileModel({
        this.status,
        this.data,
    });

    factory GetProfileModel.fromJson(Map<String, dynamic> json) => GetProfileModel(
        status: json["Status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? name;
    String? email;
    int? phone;
    String? place;
    int? pincode;

    Data({
        this.id,
        this.name,
        this.email,
        this.phone,
        this.place,
        this.pincode,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        place: json["place"],
        pincode: json["pincode"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "place": place,
        "pincode": pincode,
    };
}

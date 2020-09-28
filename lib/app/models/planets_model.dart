import 'package:flutter/cupertino.dart';

class Planet {
  int id;
  String name;
  String nickName;
  String age;
  String radius;
  String mass;
  String distanceFromSun;
  String gravity;
  String lengthOfDay;
  String lengthOfYear;
  String surfacePressure;
  String moons;
  String tiltOfAxis;
  String temperature;
  String image;

  Planet(
      {this.id,
      @required this.name,
      this.nickName = "",
      this.age = "",
      this.radius = "",
      this.mass = "",
      this.distanceFromSun = "",
      this.gravity = "",
      this.lengthOfDay = "",
      this.lengthOfYear = "",
      this.surfacePressure = "",
      this.moons = "",
      this.tiltOfAxis = "",
      this.temperature = "",
      this.image});

  Planet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nickName = json['nickName'];
    age = json['age'];
    radius = json['radius'];
    mass = json['mass'];
    distanceFromSun = json['distanceFromSun'];
    gravity = json['gravity'];
    lengthOfDay = json['lengthOfDay'];
    lengthOfYear = json['lengthOfYear'];
    surfacePressure = json['surfacePressure'];
    moons = json['moons'];
    tiltOfAxis = json['tiltOfAxis'];
    temperature = json['temperature'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['nickName'] = this.nickName;
    data['age'] = this.age;
    data['radius'] = this.radius;
    data['mass'] = this.mass;
    data['distanceFromSun'] = this.distanceFromSun;
    data['gravity'] = this.gravity;
    data['lengthOfDay'] = this.lengthOfDay;
    data['lengthOfYear'] = this.lengthOfYear;
    data['surfacePressure'] = this.surfacePressure;
    data['moons'] = this.moons;
    data['tiltOfAxis'] = this.tiltOfAxis;
    data['temperature'] = this.temperature;
    data['image'] = this.image;
    return data;
  }
}

import 'package:medpoint_mobile/domain/entities/doctor/doctor.dart';

class DoctorModel {
  final int id;
  final String? name;
  final String specialization;
  final String? avatar;

  DoctorModel({
    required this.id,
    this.name,
    required this.specialization,
    this.avatar,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json["id"],
      specialization: json["specialization"],
    );
  }

  DoctorModel copyWith({
    int? id,
    String? name,
    String? avatar,
    String? specialization,
  }) {
    return DoctorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      specialization: specialization ?? this.specialization,
    );
  }

  Doctor toEntity() {
    return Doctor(
      id: id,
      name: name,
      specialization: specialization,
      avatar: avatar,
    );
  }
}

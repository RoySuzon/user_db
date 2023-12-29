// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String? password;
  @HiveField(4)
  final String? adress;
  @HiveField(5)
  final String? blood;
  @HiveField(6)
  final String? img;
  @HiveField(7)
  final List<String>? phone;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.adress,
    this.blood,
    this.img,
    this.phone,
  });
}

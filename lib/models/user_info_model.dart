import 'dart:io';
import 'package:hive/hive.dart';
part 'user_info_model.g.dart';

@HiveType(typeId: 2)
class UserInfoModel extends HiveObject {
  @HiveField(0)
  final String fname;

  @HiveField(1)
  final String lname;

  @HiveField(2)
  final String photoUrl;

  @HiveField(3)
  final String tnumber;

  @HiveField(4)
  final String ccode;

  @HiveField(5)
  final DateTime dob;

  UserInfoModel({
    this.fname,
    this.lname,
    this.photoUrl,
    this.tnumber,
    this.ccode,
    this.dob,
  });
}

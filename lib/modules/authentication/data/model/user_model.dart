


import 'package:skori/modules/authentication/domain/entity/type_entity.dart';

import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.phone,
    required super.email,
    required super.avatar,
    required super.gender,
    required super.typeEntity,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id']??"",
        firstName: json['first_name']??"",
        lastName: json['last_name']??"",
        phone: json['phone']??"",
        email: json['email']??"",
        avatar: json['avatar']??"",
        gender: json['gender']??"",
        typeEntity: TypeModel.fromJson(json['type']),
      );


  Map<String, dynamic> toJson() => {
    'id': id,
    'first_name': firstName,
    'last_name': lastName,
    'phone': phone,
    'email': email,
    'avatar': avatar,
    'gender': gender,
    'type':typeEntityToTypeModel(typeEntity).toJson(),
  };

}

TypeModel typeEntityToTypeModel(TypeEntity typeEntity){
  return TypeModel(code: typeEntity.code, isFan: typeEntity.isFan,
      isAdmin: typeEntity.isAdmin, isPlayer: typeEntity.isPlayer, isSupervisor: typeEntity.isSupervisor);
}

class TypeModel extends TypeEntity {
  TypeModel({
    required super.code,
    required super.isFan,
    required super.isAdmin,
    required super.isPlayer,
    required super.isSupervisor,
  });


  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
    code: json["code"],
    isPlayer: json["is_player"],
    isSupervisor: json["is_supervisor"],
    isAdmin: json["is_admin"],
    isFan: json["is_fan"],
  );

  Map<String, dynamic> toJson() => {
   'code':code,
   'is_fan':isFan,
   'is_player':isPlayer,
   'is_admin':isAdmin,
   'is_supervisor':isSupervisor,
  };
}

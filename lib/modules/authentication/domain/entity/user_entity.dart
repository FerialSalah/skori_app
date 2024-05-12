import 'package:equatable/equatable.dart';
import 'package:skori/modules/authentication/domain/entity/type_entity.dart';


class UserEntity extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String avatar;
  final String gender;
  final TypeEntity typeEntity;


  UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required  this.email,
    required this.avatar,
    required this.gender,
    required this.typeEntity,
  });

  @override

  List<Object?> get props => throw UnimplementedError();

}


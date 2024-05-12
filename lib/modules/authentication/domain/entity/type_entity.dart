import 'package:equatable/equatable.dart';


class TypeEntity extends Equatable {
  final String code;
  final bool isFan;
  final bool isPlayer;
  final bool isAdmin;
  final bool isSupervisor;



  TypeEntity({
    required this.code,
    required this.isFan,
    required this.isPlayer,
    required this.isAdmin,
    required  this.isSupervisor,
  });

  @override

  List<Object?> get props => throw UnimplementedError();

}


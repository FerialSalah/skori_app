import 'package:equatable/equatable.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}


class EditProfileDate extends EditProfileEvent {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String gender;

  EditProfileDate({required this.firstName,required this.lastName,required this.phone,
    required this.email,required this.gender,} );

}






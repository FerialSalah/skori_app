
abstract class ContactUsEvent  {
  const ContactUsEvent();

  @override
  List<Object> get props => [];
}

class ContactUsCall extends ContactUsEvent {
  final String name;
  final String email;
  final String message;

  ContactUsCall( { required this.name, required this.email,required this.message,} );
}

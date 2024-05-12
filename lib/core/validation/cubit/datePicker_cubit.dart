import 'package:flutter_bloc/flutter_bloc.dart';

class DatePickerCubit extends Cubit<String?> {
  DatePickerCubit(super.initialState);
  String? date;
  void addDateTime(String datePicker) {
    date = datePicker;
    emit(date!);
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

class CupertinoPickerCubit extends Cubit<dynamic> {
  String? selectedPicker;
  int indexSelector = 0;
  int? rangSelected;
  CupertinoPickerCubit(super.initialState);

  void getSelectedCupertinoPicker(String? iteam, int index, int? rang) {
    if (iteam != null) {
      indexSelector = index;
      selectedPicker = iteam;
      rangSelected = rang;
      emit(selectedPicker);
      emit(rangSelected);
    } else {
      if (selectedPicker != null) {
        indexSelector = index;
        rangSelected = rang;
        emit(selectedPicker);
        emit(rangSelected);
      } else {
        indexSelector = 0;
        emit(null);
      }
    }
  }
}

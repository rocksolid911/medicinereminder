import 'package:flutter/foundation.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class HomeProvider extends ChangeNotifier {
  datePicker(context){
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2018, 3, 5),
        maxTime: DateTime(2019, 6, 7), onChanged: (date) {
          print('change $date');
        }, onConfirm: (date) {
          print('confirm $date');
        }, currentTime: DateTime.now(),locale: LocaleType.en) ;
  }
  timePicker(context){
    DatePicker.showTimePicker(context,
        showTitleActions: true,
        onChanged: (date) {
          print('change $date');
        }, onConfirm: (date) {
          print('confirm $date');
        }, currentTime: DateTime.now(),locale: LocaleType.en) ;
  }
}

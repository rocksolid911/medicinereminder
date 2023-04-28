import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:medicinereminder/auth/repo/authrepo.dart';
import 'package:medicinereminder/common/storage.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuth = false;
  bool get isAuth => _isAuth;
  User? _user;
  User? get user => _user;
  final SecureStorage secureStorage = SecureStorage();
  setAuth(bool value) {
    _isAuth = value;
    notifyListeners();
  }
  authGoogle()async{
    _user =await AuthRepository().signInWithGoogle();
    secureStorage.writeSecureData("uid", _user!.uid);
    if(_user!=null){
      _isAuth = true;
    }
    print(_user);
  }
  signOutGoogle()async{
    await AuthRepository().signOutGoogle();
    secureStorage.deleteSecureData("uid");
    _isAuth = false;
    _user = null;
    notifyListeners();
  }
  // void dataPicker(context) {
  //   DatePicker.showDatePicker(context, showTitleActions: true, minTime: DateTime(1950, 01, 01),
  //       maxTime: DateTime(DateTime.now().year, 12, 31),
  //       onConfirm: (date, dayStatus, monthStatus) async {
  //         if (date != null) {
  //           int age = await Util.calculateAge(date);
  //           if (age < 13) {
  //             Util.getFlashBar(context, "You must be 13 years or older to make a Page");
  //           } else {
  //             if (monthStatus && !dayStatus) {
  //               Util.getFlashBar(context, "Month alone cannot be optional");
  //             } else {
  //               String monthTemp = !monthStatus ? "${date.month}/" : "";
  //               String dayTemp = !dayStatus ? "${!monthStatus ? "" : ""}${date.day}/" : "";
  //               _date = '${!monthStatus ? monthTemp : ""}${!dayStatus ? dayTemp : ""}${monthStatus || dayStatus ? "" : ""}${date.year}';
  //               postDate = DateTime(date.year, date.month, dayStatus ? 1 : date.day);
  //               dayOptionalStatus = dayStatus;
  //               monthOptionalStatus = monthStatus;
  //               selectedDates = _date;
  //               setDate(postDate);
  //               notifyListeners();
  //             }
  //           }
  //         }
  //       }, currentTime: showDate ?? DateTime.now());
  // }

}
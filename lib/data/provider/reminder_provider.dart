import 'package:flutter/cupertino.dart';
import 'package:ird_foundation_intern/data/model/request/reminder_repo.dart';

import '../model/response/reminder_model.dart';

class ReminderProvider with ChangeNotifier{
  ReminderRepository reminderRepository = ReminderRepository();

  List<ReminderModel> _reminderList = [];
  List<ReminderModel> get reminderList => _reminderList;

  getReminderListData() async{
    _reminderList = await reminderRepository.getReminderListData();
    notifyListeners();
  }

}
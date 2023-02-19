import '../../../utill/images.dart';
import '../response/reminder_model.dart';

class ReminderRepository{
  List<ReminderModel> reminderList = [
    ReminderModel(Images.routine1, "Online Class Routine", "Save Date 15/12/2022"),
    ReminderModel(Images.routine1, "Online Class Routine", "Save Date 15/12/2022"),
    ReminderModel(Images.routine1, "Online Class Routine", "Save Date 15/12/2022"),
    ReminderModel(Images.routine1, "Online Class Routine", "Save Date 15/12/2022"),
    ReminderModel(Images.routine1, "Online Class Routine", "Save Date 15/12/2022"),
  ];

  Future<List<ReminderModel>> getReminderListData() async{
    return reminderList;
  }
}
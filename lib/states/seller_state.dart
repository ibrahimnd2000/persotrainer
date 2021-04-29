import 'package:flutter/material.dart';
import 'package:persotrainer/ui/views/bottom_tabs/mainpage.dart';
import 'package:persotrainer/ui/views/bottom_tabs/manage_order.dart';
import 'package:persotrainer/ui/views/bottom_tabs/notifications.dart';
import 'package:persotrainer/ui/views/bottom_tabs/profile.dart';
import 'package:persotrainer/ui/views/inbox.dart';
import 'package:persotrainer/ui/views/profile_page.dart';
import 'package:persotrainer/ui/views/search_page.dart';
import 'package:persotrainer/ui/views/workout_plans.dart';

class SellerState with ChangeNotifier {
  bool isSeller = true;
  double position = 1;

  toggleSwitch() {
    if (isSeller) {
      isSeller = false;
      position = 18;
    } else {
      isSeller = true;
      position = 1;
    }
    notifyListeners();
  }

  Widget generateTabs(int index) {
    List tabs = [
      Mainpage(),
      isSeller ? Inbox() : SearchPage(),
      isSeller ? ManageOrder() : WorkoutPlans(),
      Notifications(),
      isSeller ? ProfilePage() : Profile(),
    ];
    return tabs[index];
  }
}

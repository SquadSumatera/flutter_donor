import 'package:flutter/material.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/event/event_page.dart';
import 'package:flutter_donor/ui/home/home_page.dart';
import 'package:flutter_donor/ui/location/location_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  bool clickedCentreFAB = false;
  int selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = LocationPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.cRed,
        onPressed: () {
          setState(() {
            Get.toNamed(Routes.request);
          });
        },
        tooltip: "Centre FAB",
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Image.asset('assets/bitmap/blood.png'),
        ),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                //update the bottom app bar view each time an item is clicked
                onPressed: () {
                  setState(() {
                    currentScreen = HomePage();
                    selectedIndex = 0;
                  });
                },
                iconSize: 27.0,
                icon: SvgPicture.asset('assets/vector/ic_home.svg',
                    color: selectedIndex == 0 ? AppColor.cRed : AppColor.cGrey),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = LocationPage();
                    selectedIndex = 1;
                  });
                },
                iconSize: 27.0,
                icon: SvgPicture.asset('assets/vector/ic_location.svg',
                    color: selectedIndex == 1 ? AppColor.cRed : AppColor.cGrey),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              const SizedBox(
                width: 50.0,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = EventPage();
                    selectedIndex = 2;
                  });
                },
                iconSize: 27.0,
                icon: SvgPicture.asset('assets/vector/ic_dashboard.svg',
                    color: selectedIndex == 2 ? AppColor.cRed : AppColor.cGrey),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = HomePage();
                    selectedIndex = 3;
                  });
                },
                iconSize: 27.0,
                icon: SvgPicture.asset('assets/vector/ic_profile.svg',
                    color: selectedIndex == 3 ? AppColor.cRed : AppColor.cGrey),
              ),
            ],
          ),
        ),
        //to add a space between the FAB and BottomAppBar
        shape: const CircularNotchedRectangle(),
        //color of the BottomAppBar
        color: Colors.white,
      ),
    );
  }
}

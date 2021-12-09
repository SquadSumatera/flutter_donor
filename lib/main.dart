import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/models/token_model.dart';
import 'package:flutter_donor/services/token_services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes/app_pages.dart';

void main() {
  initializeDateFormatting('id');
  WidgetsFlutterBinding.ensureInitialized();
  final LoginGetX main = Get.put(LoginGetX());
  Get.putAsync<SharedPreferences>(() async {
    SharedPreferences getPref = await SharedPreferences.getInstance();
    main.changeOnBoard(getPref.getBool("onboard") ?? true);
    main.changeToken(getPref.getString("token") ?? "");
    if (main.token.value.isNotEmpty) {
      TokenModel tokenModel =
          await TokenServices.tokenCheck(token: main.token.value);
      if (tokenModel.status != 201) {
        main.changeToken("");
        getPref.setString("token", "");
      }
    }
    return getPref;
  });

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.transparent, // status bar
      statusBarIconBrightness: Brightness.dark // color
      ));
  runApp(const DorplasApp());
}

class DorplasApp extends StatelessWidget {
  const DorplasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
    );
  }
}

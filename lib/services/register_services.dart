import 'package:flutter_donor/models/register_model.dart';
import 'package:http/http.dart';

class RegisterServices {
  static Future<RegisterModel> registerCheck({
    required String nameDonators,
    required String emailDonators,
    required String passwordDonators,
    required String addressDonators,
    required String contactDonators,
  }) async {
    Response _response = await post(
      Uri.parse("http://dorplas.herokuapp.com/register"),
      body: <String, String>{
        "name_donators": nameDonators,
        "email_donators": emailDonators,
        "password_donators": passwordDonators,
        "address_donators": addressDonators,
        "contact_donators": contactDonators,
      },
    );

    return RegisterModel.fromJson(_response.body);
  }
}

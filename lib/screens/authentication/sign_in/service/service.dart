import 'package:dio/dio.dart';
import 'package:noviindus_machine_test/main.dart';
import 'package:noviindus_machine_test/utils/middleware/dio_middleware.dart';
import 'package:noviindus_machine_test/utils/shared_preference/shared_preference_keys.dart';

class SignInService {
  static Future signIn(
      {required String userName, required String password}) async {
    try {
      FormData formData =
          FormData.fromMap({"username": userName, "password": password});
      Response response =
          await dioApiCall().post(apiRoutes.signIn, data: formData);
      if(response.statusCode==200){
        await sharedDataController.setSharedData(key: SharedPreferenceKeys.token, value: response.data["token"]);
        return true;
      }
      else{
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }
}

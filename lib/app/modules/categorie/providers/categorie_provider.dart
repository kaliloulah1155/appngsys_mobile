import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/api_endpoint.dart';

class CategorieProvider extends GetConnect  {
  //Fetch Data
  Future<Response> get_categories() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      Response response=await post(
        ApiEndPoint.baseUrl+ApiEndPoint.authEndPoints.categorie,
        {},
        headers: {
          'Content-Type':'application/json; charset=UTF-8',
          'Authorization':'Bearer $token'
        },
      );
      if (response.status.hasError) {
        return Future.error(response.statusText.toString());
      } else {

        return response;
      }
    } catch (e) {
      return Response(statusCode:1,statusText: e.toString());
    }
  }
}

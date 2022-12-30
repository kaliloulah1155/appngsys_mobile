import 'dart:convert';

import 'package:appngys/app/modules/home/auth_model.dart';
import 'package:appngys/utils/api_endpoint.dart';
import 'package:get/get.dart';

class AuthProvider extends GetConnect implements GetxService {

  //Fetch Data
  Future<Response> get_auth() async {
    try {
      Response response=await get(
          ApiEndPoint.baseUrl+ApiEndPoint.authEndPoints.logger,
          headers: {
            'Content-Type':'application/json; charset=UTF-8'
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

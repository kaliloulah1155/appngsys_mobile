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

  //Add Data
  Future<Response> addCategorie(Map data) async{
    final form = FormData({
      "cod": data['cod'],
      "lfr": data['lfr'],
      "len": data['len']
    });
    // Make a form data body
    try{
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      final response=await post(ApiEndPoint.baseUrl+ApiEndPoint.authEndPoints.categorie_add,
        form,
        headers: {
          'Authorization':'Bearer $token'
        },
        contentType: "multipart/form-data",
      );
      if(response.status.hasError){
        return Future.error(response.statusText.toString());
      }else{
        return response;
      }
    }catch(exception){
      return Future.error(exception);
    }
  }

  //Update Data
  Future<Response> updateCategorie(Map data) async{
    final form = FormData({
      "id": "${data['id']}",
      "lfr": data['lfr'],
      "len": data['len']
    });
    // Make a form data body
    try{
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      final response=await post(ApiEndPoint.baseUrl+ApiEndPoint.authEndPoints.categorie_up,
          form,
          headers: {
             'Authorization':'Bearer $token'
          },
          contentType: "multipart/form-data",
      );
      if(response.status.hasError){
        return Future.error(response.statusText.toString());
      }else{
        return response;
      }
    }catch(exception){
      return Future.error(exception);
    }
  }

  //Delete Data
  Future<Response> deleteCategorie(var id) async{
    final form = FormData({
      "id": "$id"
    });
    // Make a form data body
    try{
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      final response=await post(ApiEndPoint.baseUrl+ApiEndPoint.authEndPoints.categorie_del,
        form,
        headers: {
          'Authorization':'Bearer $token'
        },
        contentType: "multipart/form-data",
      );
      if(response.status.hasError){
        return Future.error(response.statusText.toString());
      }else{
        return response;
      }
    }catch(exception){
      return Future.error(exception);
    }
  }





}

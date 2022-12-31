class ApiEndPoint{
  //static final String baseUrl="http://10.0.2.2:81/API_RES_POSEIDON/api/"; //for emulator
  static final String baseUrl="http://192.168.1.159:81/API_RES_POSEIDON/api/"; //for mobile phone(allow config on your serveur)
  static _AuthEndPoint authEndPoints=_AuthEndPoint();
}
class _AuthEndPoint{
  final String logger="authentication/Logger.php";
  final String categorie="categories/categories.php";
  final String categorie_up="categories/update.php";
  final String categorie_del="categories/destroy.php";
}



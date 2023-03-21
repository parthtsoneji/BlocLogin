import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loginbloc/Services/LoginModel.dart';

abstract class LoginRepo {
  Future<LoginResponse> getLoginRepo();
}

class LoginApi extends LoginRepo {
  late LoginResponse data;

  @override
  Future<LoginResponse> getLoginRepo() async {
    String api = 'https://coupinos-app.azurewebsites.net/login';
    Map postBody = {"email": "learntest43+1@gmail.com", "password": "Test@123"};
    var body = json.encode(postBody);
    var result = await http.post(Uri.parse(api), body: body, headers: {
      'Content-type': 'application/json',
    });
    print(result);
    if (result.statusCode == 200) {
      final json = result.body;
      Map<String, dynamic> map = jsonDecode(json);
      final local = LoginResponse.fromJson(map);
      data =local;
      return data;
    } else {
      throw Exception("not found");
    }
  }
}

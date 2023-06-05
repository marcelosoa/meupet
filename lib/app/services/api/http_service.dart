import 'package:http/http.dart' as http;

abstract class IHttpService {
  Future get({required String url});
}

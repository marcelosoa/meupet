import 'http_service.dart';
import 'package:http/http.dart' as http;

class HttpServiceImpl implements IHttpService {
  final client = http.Client();
  @override
  Future get({required String url}) async {
    return await client.get(Uri.parse('http://localhost:3000/hero'));
  }
}

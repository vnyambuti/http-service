import 'package:http/http.dart' as http;

class HttpService {
  Future<String> getData() async {
    final url = Uri.https("jsonplaceholder.typicode.com", "/users");
    final response = await http.get(url);
    return response.body;
  }
}

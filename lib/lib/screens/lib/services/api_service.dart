import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map> getSignal() async {
    final res = await http.get(
      Uri.parse("https://YOUR_BACKEND_URL/live-signal"),
    );
    return jsonDecode(res.body);
  }
}

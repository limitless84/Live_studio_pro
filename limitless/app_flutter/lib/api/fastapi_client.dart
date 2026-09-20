import 'package:http/http.dart' as http;
import 'dart:convert';

class FastApiClient {
  final String baseUrl;

  FastApiClient(this.baseUrl);

  Future<void> sendMessage(String content) async {
    final url = Uri.parse("$baseUrl/api/send");
    
    await http.post(
      url,
      body: jsonEncode({
        "content": content,
        "sender": "flutter"
      }),
      headers: {"Content-Type": "application/json"},
    );
  }
}

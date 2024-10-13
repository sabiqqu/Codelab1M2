import 'package:http/http.dart' as http;
import '../models/news_model.dart';

class NewsApiService {
  static const String _baseUrl = 'https://my-json-server.typicode.com/Fallid/codelab-api/db';

  Future<Pokedex> fetchNews() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return pokedexFromJson(response.body);
    } else {
      throw Exception('Failed to load news');
    }
  }
}

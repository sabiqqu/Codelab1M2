import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../services/news_api_service.dart';
import '../widgets/news_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NewsApiService _apiService = NewsApiService();
  late Future<Pokedex> _futureNews;

  @override
  void initState() {
    super.initState();
    _futureNews = _apiService.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita Terkini'),
      ),
      body: FutureBuilder<Pokedex>(
        future: _futureNews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.articles.length,
              itemBuilder: (context, index) {
                return NewsListItem(article: snapshot.data!.articles[index]);
              },
            );
          } else {
            return const Center(child: Text('Tidak ada berita'));
          }
        },
      ),
    );
  }
}

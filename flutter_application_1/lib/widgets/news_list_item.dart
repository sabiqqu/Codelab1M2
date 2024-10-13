import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../screens/webview_screen.dart';

class NewsListItem extends StatelessWidget {
  final Article article;

  const NewsListItem({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: _buildLeadingImage(article.urlToImage),
        title: Text(
          article.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          article.description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewScreen(url: article.url),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLeadingImage(String imageUrl) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error);
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

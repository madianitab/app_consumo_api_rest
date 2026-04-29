import 'package:flutter/material.dart';
import '../controllers/post_controller.dart';

class HomePage extends StatelessWidget {
  final PostController _controller = PostController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Minha API - Lista Simples")),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, child) {
          if (_controller.error != null) return Center(child: Text(_controller.error!));
          if (_controller.isLoading) return Center(child: CircularProgressIndicator());

          // Lista de títulos simples
          return ListView.builder(
            itemCount: _controller.posts.length,
            itemBuilder: (context, i) {
              final post = _controller.posts[i];
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  leading: Icon(Icons.article),
                  title: Text(post.title),
                  subtitle: Text(post.body,maxLines: 2,overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),),
                  onTap: () => print('Clicou no post: ${post.title}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../controllers/post_controller.dart';

class HomePage extends StatelessWidget {
  final PostController _controller = PostController();

// Método para exibir o diálogo de criação de post
  void _showAddPostDialog(BuildContext context) {
    final titleController = TextEditingController();
    final bodyController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Novo Post"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Título"),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(labelText: "Corpo"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () {
              // Chama o método no Controller
              _controller.addPost(titleController.text, bodyController.text);
              Navigator.pop(context);
            },
            child: const Text("Salvar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Minha API - Lista com Card e Corpo")),
      // Adição do botão flutuante aqui
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddPostDialog(context),
        child: const Icon(Icons.add),
      ),
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
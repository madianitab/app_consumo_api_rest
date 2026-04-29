import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/api_service.dart';

class PostController extends ChangeNotifier {
  final ApiService _api = ApiService();
  
  List<Post> posts = [];
  bool isLoading = true;
  String? error;

  PostController() {
    loadPosts();
  }

  Future<void> loadPosts() async {
    try {
      isLoading = true;
      notifyListeners();
      
      posts = await _api.getPosts();
      error = null;
    } catch (e) {
      error = "Erro ao carregar dados: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addPost(String title, String body) async {
    try {
      // Chama o serviço
      final newPost = await _api.createPost(title, body);
      
      // Adiciona no início da lista para facilitar a visualização (Feedback imediato)
      posts.insert(0, newPost);
      
      // Avisa a View que os dados mudaram
      notifyListeners();
    } catch (e) {
      debugPrint("Erro ao adicionar post: $e");
      // Opcional: tratar o erro na interface futuramente
    }
  }
}
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
}
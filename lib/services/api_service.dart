import 'package:dio/dio.dart';
import '../models/post.dart';



/*class ApiService {
  final Dio _dio = Dio();
  Future<List<Post>> getPosts() async {
    final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
    return (response.data as List).map((json) => Post.fromJson(json)).toList();
  }
}*/

//Usar esse dummyjason se der erro 403
class ApiService {
  final Dio _dio = Dio();

  Future<List<Post>> getPosts() async {
    final response = await _dio.get('https://dummyjson.com/posts');
    
    // O DummyJSON retorna um objeto (Map) - a chave 'posts' contém a lista
    final List<dynamic> data = response.data['posts'];
    
    return data.map((json) => Post.fromJson(json)).toList();
  }
}

//Se quiser colocar dados mocados para que funcione o front

/*class ApiService {
  // Vamos criar um método que simula a resposta da API
  Future<List<Post>> getPosts() async {
    // Simulamos um tempo de espera (como se fosse a rede)
    await Future.delayed(Duration(seconds: 2));

    // Retornamos dados fixos (Mock)
    return [
      Post(id: 1, title: "Título de Exemplo 1", body: "Este é o corpo do texto de teste."),
      Post(id: 2, title: "Título de Exemplo 2", body: "Mais um post para testar a lista."),
      Post(id: 3, title: "Título de Exemplo 3", body: "O design do card está funcionando perfeitamente!"),
    ];
  }
}*/
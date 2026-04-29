import 'package:flutter/material.dart';
import 'pages/home_page.dart'; // Importa apenas a tela inicial

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Opcional: remove aquela faixa de "Debug"
      title: 'App API',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: HomePage(), // Chama a tela que você criou lá em pages/
    );
  }
}
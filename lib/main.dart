import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hola Mundo',
      home: const HolaMundoPage(),
    );
  }
}

class HolaMundoPage extends StatefulWidget {
  const HolaMundoPage({super.key});

  @override
  State<HolaMundoPage> createState() => _HolaMundoPageState();
}

class _HolaMundoPageState extends State<HolaMundoPage> {
  final PageController _controller = PageController();

  final List<String> mensajes = [
    "Hola Mundo",
    "Soy Kevin",
    "Kevin López Ocampo",
    "Soy de 10 C",
  ];

  @override
  void initState() {
    super.initState();
    // animación automática
    Future.delayed(const Duration(seconds: 2), _autoScroll);
  }

  void _autoScroll() async {
    for (int i = 0; i < mensajes.length; i++) {
      await Future.delayed(const Duration(seconds: 2));
      if (_controller.hasClients) {
        _controller.animateToPage(
          i,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
    
    _autoScroll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: SizedBox(
          height: 100,
          child: PageView.builder(
            controller: _controller,
            itemCount: mensajes.length,
            itemBuilder: (context, index) {
              return Center(
                child: Text(
                  mensajes[index],
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

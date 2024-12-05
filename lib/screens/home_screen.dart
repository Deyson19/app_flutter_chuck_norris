import 'package:chuck_norris/providers/joke_provider.dart';
import 'package:chuck_norris/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/joke_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _jokeProvider = JokeProvider();
  late Future<Joke> joke;
  bool displaySnackbar = false;
  @override
  void initState() {
    super.initState();
    joke = _jokeProvider.fetchJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Joke>(
        future: joke,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Cargando Resultado...",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CircularProgressIndicator(
                    color: Colors.blue,
                    strokeAlign: 15.0,
                    strokeCap: StrokeCap.butt,
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("No hay resultados"),
            );
          } else {
            displaySnackbar = snapshot.hasData;
            return JokeCard(joke: snapshot.data!);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          joke = _jokeProvider.fetchJoke();
          setState(() {
            if (displaySnackbar) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Joke cargado con éxito"),
              ));
            }
          });
        },
        backgroundColor: Colors.red,
        child: Icon(
          Icons.refresh_outlined,
          shadows: [
            BoxShadow(
                color: Colors.white10.withOpacity(0.5),
                blurRadius: 5.0,
                spreadRadius: 3,
                offset: const Offset(0, 5))
          ],
        ),
      ),
    );
  }
}

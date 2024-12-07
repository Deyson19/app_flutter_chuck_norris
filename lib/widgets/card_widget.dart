import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/joke_model.dart';

class JokeCard extends StatefulWidget {
  const JokeCard({super.key, required this.joke});
  final Joke joke;
  final String chuckImage ="https://4.bp.blogspot.com/-Y-ncAf3VUTA/VBfuQnJeCGI/AAAAAAAAA70/O4CN676kxYU/s1600/158277069_076e03.jpg";
  @override
  State<JokeCard> createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.cyan
      ),
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(
                widget.chuckImage,
              ),
              fit: BoxFit.fill,
              colorFilter: const ColorFilter.mode(Color.fromARGB(255, 28, 84, 105), BlendMode.dstOver)
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    widget.joke.iconUrl
                  ),
                ),
                const SizedBox(height: 10,),
                Center(
                  child: Text(
                    widget.joke.value,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                Text(
                  'Fecha Creación: ${widget.joke.createdAt}',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                      color: const Color.fromARGB(255, 249, 253, 2)
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                  'Fecha Actualización: ${widget.joke.updatedAt}',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                      color: const Color.fromARGB(255, 2, 247, 234)
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
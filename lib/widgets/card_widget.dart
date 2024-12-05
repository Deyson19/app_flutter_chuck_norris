import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/joke_model.dart';

class JokeCard extends StatefulWidget {
  const JokeCard({super.key, required this.joke});
  final Joke joke;
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
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                'Fecha Creación: ${widget.joke.createdAt}',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                'Fecha Actualización: ${widget.joke.updatedAt}',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
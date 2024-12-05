import 'package:chuck_norris/models/joke_model.dart';
import 'package:dio/dio.dart' as httpDio;

class JokeProvider {
 final String baseUrl ="https://api.chucknorris.io/jokes/random";
 bool isLoading = false;
 late Joke joke;

 Future<Joke> fetchJoke() async {
  isLoading = true;
  try {
    final request = await httpDio.Dio().get(baseUrl);
    if (request.statusCode ==200) {
      final response = request.data;
      final myJoke = Joke.fromJson(response);
      joke = myJoke;
      await Future.delayed(const Duration(seconds: 2));
      isLoading = false;
      return joke;
    }else{
      isLoading = false;
      return joke;
    }
  } catch (e) {
    print('Error to fetch data: {e}');
    isLoading = false;
    throw Exception('Error to fetch');
  }
 }
}
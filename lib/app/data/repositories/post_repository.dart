import 'package:dio/dio.dart';
import 'package:teste_esig/app/data/http/exceptions.dart';
import 'package:teste_esig/app/data/http/http_client.dart';
import 'package:teste_esig/app/data/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


abstract class IPostRepository {
  Future<List<PostModel>> getPost();
}


class PostRepository implements IPostRepository {
  final IHttpClient client;

  PostRepository({required this.client});

  @override
  Future<List<PostModel>> getPost() async {
    try {
      final http.Response response = await client.get(
        url: 'https://jsonplaceholder.typicode.com/posts',
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);

        final List<PostModel> posts = jsonList
            .map((item) => PostModel.fromMap(item))
            .toList();

        return posts;
      } else if (response.statusCode == 404) {
        throw NotFoundException('A URL informada não é válida');
      } else {
        throw Exception('Não foi possível carregar os posts');
      }
    } on http.ClientException catch (e) {
      // Handle HTTP client errors here
      throw Exception('Erro na requisição: ${e.message}');
    }
  }
}

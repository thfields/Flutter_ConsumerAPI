import 'package:dio/dio.dart';
import 'package:teste_esig/app/data/http/exceptions.dart';
import 'package:teste_esig/app/data/http/http_client.dart';
import 'package:teste_esig/app/data/models/post_model.dart';


abstract class IPostRepository {
  Future<List<PostModel>> getPost();
}

class PostRepository implements IPostRepository {
  final IHttpClient client;

  PostRepository({required this.client});

  @override
  Future<List<PostModel>> getPost() async {
    try {
      final response = await client.get(
        url: 'https://jsonplaceholder.typicode.com/posts',
      );

      if (response.statusCode == 200) {
        final List<PostModel> posts = [];

        final List<dynamic> body = response.data;

        body.map((item) {
          final PostModel post = PostModel.fromMap(item);
          posts.add(post);
        }).toList();

        return posts;
      } else if (response.statusCode == 404) {
        throw NotFoundException('A url informada não é válida');
      } else {
        throw Exception('Não foi possível carregar os posts');
      }
    } on DioError catch (e) {
      // Handle Dio errors here
      throw Exception('Erro na requisição: ${e.message}');
    }
  }
}

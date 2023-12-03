import 'package:teste_esig/app/data/models/post_model.dart';

abstract class IPostRepository {
  Future<List<PostModel>> getPost();
}

class PostRepository implements IPostRepository {
  @override
  Future<List<PostModel>> getPost() {
    // TODO: implement getPost
    throw UnimplementedError();
  }
}

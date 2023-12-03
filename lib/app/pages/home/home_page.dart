import 'package:flutter/material.dart';
import 'package:teste_esig/app/data/http/exceptions.dart';
import 'package:teste_esig/app/data/http/http_client.dart';
import 'package:teste_esig/app/data/repositories/post_repository.dart';
import 'package:teste_esig/app/pages/home/stores/post_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostStore store = PostStore(
    repository: PostRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    store.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Feed Posts',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge([
          store.isLoading,
          store.erro,
          store.state,
        ]),
        builder: (context, child) {
          if (store.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (store.erro.value.isNotEmpty) {
            return Center(
              child: Text(
                store.erro.value,
                style: const TextStyle(
                  color: Colors.red, // Use a cor que preferir para indicar erro
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }

          if (store.state.value.isEmpty) {
            return const Center(
              child: Text(
                'Nenhum post no feed',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 32,
              ),
              padding: const EdgeInsets.all(16),
              itemCount: store.state.value.length,
              itemBuilder: (_, index) {
                final item = store.state.value[index];
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        item.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User ID: ${item.userId}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.body,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}

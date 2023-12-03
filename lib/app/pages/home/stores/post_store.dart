import 'package:flutter/material.dart';
import 'package:teste_esig/app/data/http/exceptions.dart';
import 'package:teste_esig/app/data/models/post_model.dart';
import 'package:teste_esig/app/data/repositories/post_repository.dart';

class PostStore {
  final IPostRepository repository;

  // Variável reativa para o loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variável reativa para o state
  final ValueNotifier<List<PostModel>> state =
      ValueNotifier<List<PostModel>>([]);

  // Variável reativa para o erro
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  PostStore({required this.repository});

  Future getPosts() async {
    isLoading.value = true;

    try {
      final result = await repository.getPost();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}
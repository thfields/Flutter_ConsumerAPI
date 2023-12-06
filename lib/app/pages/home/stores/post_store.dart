import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_esig/app/data/http/exceptions.dart';
import 'package:teste_esig/app/data/models/post_model.dart';
import 'package:teste_esig/app/data/repositories/post_repository.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  final IPostRepository repository;

  @observable
  bool isLoading = false;

  @observable
  List<PostModel> state = [];

  @observable
  String erro = '';

  _PostStore({required this.repository});

  @action
  Future<void> getPosts() async {
    isLoading = true;

    try {
      final result = await repository.getPost();
      state = result;
    } on NotFoundException catch (e) {
      erro = e.message;
    } catch (e) {
      erro = e.toString();
    }

    isLoading = false;
  }
}
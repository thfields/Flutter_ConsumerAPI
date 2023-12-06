// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostStore on _PostStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_PostStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$stateAtom = Atom(name: '_PostStore.state', context: context);

  @override
  List<PostModel> get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(List<PostModel> value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$erroAtom = Atom(name: '_PostStore.erro', context: context);

  @override
  String get erro {
    _$erroAtom.reportRead();
    return super.erro;
  }

  @override
  set erro(String value) {
    _$erroAtom.reportWrite(value, super.erro, () {
      super.erro = value;
    });
  }

  late final _$getPostsAsyncAction =
      AsyncAction('_PostStore.getPosts', context: context);

  @override
  Future<void> getPosts() {
    return _$getPostsAsyncAction.run(() => super.getPosts());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
state: ${state},
erro: ${erro}
    ''';
  }
}

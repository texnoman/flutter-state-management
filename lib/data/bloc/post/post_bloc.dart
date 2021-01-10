import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_posts/data/models/post_model.dart';
import 'package:fake_posts/data/services/post_service.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial());
  List<PostModel> posts = List<PostModel>();

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is PostFetched) {
      yield* mapPostFetchedOrRefreshedToState();
    }
    if (event is PostRefreshed) {
      yield* mapPostFetchedOrRefreshedToState(isRefreshed: true);
    }
  }

  Stream<PostState> mapPostFetchedOrRefreshedToState({
    bool isRefreshed = false,
  }) async* {
    yield PostLoading();
    try {
      if (isRefreshed) {
        posts = List<PostModel>();
      }
      final result = await PostService.getPosts();
      posts.addAll(result);
      yield PostSuccess(posts: posts);
    } catch (_) {
      print(_);
      yield PostFailure();
    }
  }
}

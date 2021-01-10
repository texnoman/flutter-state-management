part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class PostInitial extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoading extends PostState {
  @override
  List<Object> get props => [];
}

class PostFailure extends PostState {
  @override
  List<Object> get props => [];
}

class PostSuccess extends PostState {
  final List<PostModel> posts;

  PostSuccess({
    this.posts,
  });

  PostSuccess copyWith({
    final List<PostModel> posts,
  }) {
    return PostSuccess(
      posts: posts ?? this.posts,
    );
  }

  @override
  List<Object> get props => [posts];
}

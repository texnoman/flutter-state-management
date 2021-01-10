part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class PostFetched extends PostEvent {
  @override
  List<Object> get props => [];
}

class PostRefreshed extends PostEvent {
  @override
  List<Object> get props => [];
}

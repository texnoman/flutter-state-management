import 'package:fake_posts/data/bloc/post/post_bloc.dart';
import 'package:fake_posts/ui/widgets/PostWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fake Posts"),
        backgroundColor: Colors.amber,
      ),
      body: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        if (state is PostLoading || state is PostInitial) return Center(child: CircularProgressIndicator());
        if (state is PostFailure)
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Qandaydir xatolik sodir bo'ldi"),
                FlatButton(
                  onPressed: () {
                    BlocProvider.of<PostBloc>(context).add(PostRefreshed());
                  },
                  color: Colors.amber,
                  child: Text("Qayta urinib ko'rish"),
                ),
              ],
            ),
          );
        if (state is PostSuccess) return body(context, state);
        return Container();
      }),
    );
  }

  Widget body(BuildContext context, PostSuccess state) {
    return ListView.builder(
      itemCount: state.posts.length,
      itemBuilder: (context, index) {
        return PostWidget(
          postModel: state.posts[index],
        );
      },
    );
  }
}

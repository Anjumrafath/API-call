import 'package:apihandling/logic/cubits/postcubit.dart';
import 'package:apihandling/logic/cubits/poststate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apihandling/data/models/post_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("API Call"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PostLoadedState) {
              return buildPostListView(state.posts);
            }
            return Center(
              child: Text("An error occured!"),
            );
          },
        ),
      ),
    );
  }

  Widget buildPostListView(List<PostModel> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        PostModel post = posts[index];
        return ListTile(
          title: Text(post.title.toString()),
          subtitle: Text(post.body.toString()),
        );
      },
    );
  }
}

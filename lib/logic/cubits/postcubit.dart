import 'package:apihandling/data/models/post_model.dart';
import 'package:apihandling/logic/cubits/poststate.dart';
import 'package:apihandling/presentation/screens/repositories/postrepositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPosts();
  }
  PostRepository postRepository = PostRepository();

  void fetchPosts() async {
    try {
      List<PostModel> posts = await postRepository.fetchPosts();
      emit(PostLoadedState(posts));
    } catch (ex) {
      emit(PostErrorState(ex.toString()));
    }
  }
}

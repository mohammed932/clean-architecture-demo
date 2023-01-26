part of 'posts.imports.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsLoadedState) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                PostEntity post = state.posts[index];
                return ListTile(
                  leading: Text(post.id.toString()),
                  title: Text(post.title),
                  subtitle: Text(post.title),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PostDetailsScreen(postId: post.id),
                    ));
                  },
                );
              },
            );
          } else if (state is PostsErrorState) {
            final error = Utils.tryCast<ServerFailure>(state.failure);
            return Center(
              child: Text(error!.serverException.message),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

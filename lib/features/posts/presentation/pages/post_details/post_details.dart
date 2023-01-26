part of 'post_details.imports.dart';

class PostDetailsScreen extends StatefulWidget {
  final int postId;
  const PostDetailsScreen({super.key, required this.postId});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('post details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<PostDetailsBloc, PostDetailsState>(
          builder: (context, state) {
            if (state is PostDetailsLoadedState) {
              return Column(
                children: [
                  Card(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20.0),
                      child: Text(state.post.body),
                    ),
                  )
                ],
              );
            } else if (state is PostDetailsErrorState) {
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
      ),
    );
  }
}

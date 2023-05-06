import 'package:go_router/go_router.dart';
import 'package:task/core/route/app_pages.dart';
import 'package:task/feature/post/data/model/post_data.dart';
import 'package:task/feature/post/screen/post_details.dart';
import 'package:task/feature/post/screen/post_screen.dart';

class AppRoute {
  static final router = GoRouter(
    initialLocation: AppPages.post,
    routes: [
      GoRoute(
        path: AppPages.post,
        builder: (context, state) => const PostScreen(),
      ),
      GoRoute(
        path: AppPages.postDetails,
        builder: (context, state) => PostDetailScreen(postData: (state.extra as PostData)),
      ),
    ],
  );
}
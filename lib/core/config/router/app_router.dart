import 'package:go_router/go_router.dart';
import 'package:random_user_app/presentation/screens/home_screen.dart';

///
/// App routes configuration
///
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: HomeScreen.routeName,
      path: '/',
      builder: (context, state) => const HomeScreen(),
    )
  ],
);

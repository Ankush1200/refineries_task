import 'package:go_router/go_router.dart';
import 'package:gov_data/src/features/views/chart.dart';
import 'package:gov_data/src/features/views/home.dart';

// GOROUTER FOR THE ROUTE MANAGEMNET
final GoRouter routers=GoRouter(
  initialLocation:HomePage.routePath,
  routes: [
    
    GoRoute(path:HomePage.routePath,builder: (context, state) => const HomePage(), ),

    GoRoute(path:ChartScreen.routePath,builder: (context,state)=> const ChartScreen() ),
     
]);
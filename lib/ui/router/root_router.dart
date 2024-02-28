import 'package:auto_route/auto_route.dart';
// import 'package:new_user_questionnaire/logic/riverpod_objects.dart';
import 'package:longevity_ai_questionnaire/ui/views/main_view/main_view.dart';
import 'package:longevity_ai_questionnaire/ui/views/tester_view.dart';
// import 'package:new_user_questionnaire/domain/patient_details.dart';
part 'root_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class RootRouter extends _$RootRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes {
    return [
      //AutoRoute(page: TesterRoute.page, initial: true),
      AutoRoute(page: MainRoute.page, initial: true),
    ];//This case for the normal workflow
  }
}

// ignore: non_constant_identifier_names
final AppRouter = RootRouter();
final appContext = AppRouter.navigatorKey.currentContext!;

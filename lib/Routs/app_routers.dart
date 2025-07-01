import 'package:assessment/Bloc%20and%20Cubit/Bloc%20Example/Presentation/todo_bloc.dart';
import 'package:assessment/Bloc%20and%20Cubit/Bloc%20Example/Presentation/todo_screen.dart';
import 'package:assessment/Bloc%20and%20Cubit/Cubit/Presentation/todo_cubit_screen.dart';
import 'package:assessment/Features/History/Presentation/history_page.dart';
import 'package:assessment/Features/Home/Data/dog_modal.dart';
import 'package:assessment/Features/Home/Presentation/home_page.dart';
import 'package:assessment/Form/multi_page_form.dart';
import 'package:assessment/Graph/line_chart_screen.dart';
import 'package:assessment/MethodChennal/battery_native_code.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Features/Detail/Presentation/detail_page.dart';

class AppRouts{

  GoRouter route = GoRouter(routes: [
    GoRoute(path: "/",pageBuilder: (context,state){
      return const MaterialPage(
        child:  HomePage()
      );
    }),

     GoRoute(path: "/history",pageBuilder: (context,state){
       return const MaterialPage(child: HistoryPage());
     }),

    GoRoute(path: "/detail",pageBuilder: (context,state){
      DogListModal modal = state.extra as DogListModal;
      return  MaterialPage(child: DetailPage(dogListModal: modal,));
    }),

    GoRoute(path: "/method",pageBuilder: (context,state){
      return MaterialPage(child: BatteryLevel());
    }),

    GoRoute(path: "/todo-cubit",pageBuilder: (context,state){
      return  CustomTransitionPage(
        key: state.pageKey,
        child: const TodoCubitScreen(),

        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(begin: 0.0, end: 1.0);
          final rotateAnimation = animation.drive(tween);

          return RotationTransition(turns: rotateAnimation, child: child);
        },
      );
    }),

    GoRoute(path: "/todo-bloc",pageBuilder: (context,state){
      return const MaterialPage(child: TodoScreen());
    }),

    GoRoute(path: "/line-chart",pageBuilder: (context,state){
      return const MaterialPage(child: LineChartScreen());
    }),

    GoRoute(path: "/multi-form",pageBuilder: (context,state){
      return const MaterialPage(child: MultiPageForm());
    }),



  ]);

}
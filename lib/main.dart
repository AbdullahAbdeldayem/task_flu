


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_flu/constants/const.dart';
import 'package:task_flu/cubits/app_cubit/app_cubit.dart';
import 'package:task_flu/ui/%D8%A7home/home_view.dart';
import 'package:task_flu/ui/login/login_view.dart';

import 'helpers/cache_helper.dart';
import 'helpers/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();


  await CacheHelper.init();
  username = await CacheHelper.GetData(key: 'username');
  Widget? widget;
  if (username == null) {
    widget =  const LoginView();
  } else {

    widget =  HomeView(name: username ?? '');
  }

  runApp( MyApp(widget));
}

class MyApp extends StatelessWidget {
  Widget widget;
  MyApp(this.widget, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit())
      ],
      child: MaterialApp(
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: widget,
      ),
    );
  }
}

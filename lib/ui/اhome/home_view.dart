import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/colors.dart';
import '../../constants/const.dart';
import '../../cubits/app_cubit/app_cubit.dart';
import '../../cubits/app_cubit/app_cubit_states.dart';

class HomeView extends StatefulWidget {
  String name = '';
  HomeView({Key? key, required this.name}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    if(username != null){
      AppCubit.get(context).getHomeData();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return ConditionalBuilder(
              condition: AppCubit.get(context).homeModel != null,
              builder: (context) => Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      systemOverlayStyle: const SystemUiOverlayStyle(
                          statusBarColor: Colors.white,
                          statusBarIconBrightness: Brightness.dark),
                      title: Center(
                        child: Text(
                          'Welcome ${widget.name}',
                          style: TextStyle(
                              color: orange,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    body: ListView.separated(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        itemBuilder: (context, i) => Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: ListTile(
                                title: Row(
                                  children: [
                                    const Text('name:'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${AppCubit.get(context).names[i]}',
                                      style: TextStyle(
                                          color: orange,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                subtitle: Row(
                                  children: [
                                    const Text('strength:'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${AppCubit.get(context).strength[i]}',
                                      style: TextStyle(
                                          color: orange, fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                            ),
                        separatorBuilder: (context, i) => const SizedBox(
                              height: 12,
                            ),
                        itemCount: AppCubit.get(context).names.length),
                  ),
              fallback: (context) => Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: orange,
                  ),
                ),
              ));
        });
  }
}

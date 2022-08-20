import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_flu/helpers/dio_helper.dart';
import 'package:task_flu/models/home_model.dart';

import 'app_cubit_states.dart';

class AppCubit extends Cubit<AppCubitState> {
  AppCubit() : super(AppCubitInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  // var database;
  HomeModel? homeModel;
  List names = [];
  List strength = [];
  // CreateDatabase() async {
  //   database = await openDatabase('users.db', version: 1,
  //       onCreate: (database, version) {
  //     database.execute('CREATE TABLE user (username TEXT)');
  //   }, onOpen: (database) {
  //     print('opened');
  //   });
  // }
  //
  // Future InsertToDatabase({
  //   required String name,
  // }) {
  //   return database.transaction((txn) async {
  //     await txn
  //         .rawInsert('INSERT INTO user(usrename) VALUES("${name.toString()}")')
  //         .then((value) async {})
  //         .catchError((error) {
  //       Getdatabase();
  //     });
  //   });
  // }
  //
  // Future Getdatabase() async {
  //   await database.rawQuery('SELECT * FROM user');
  // }

  getHomeData() {
    emit(AppCubitLoadingState());
    DioHelper.getData(url: 'ae5ccacf-588a-45aa-a219-d8f332e220a5')
        .then((value) {
      homeModel = HomeModel.fromJson(value.data);
      emit(AppCubitSuccesState());
      print(value.data);
    }).then((value) {
      for (int problems = 0;
          problems < homeModel!.problems!.length;
          problems++) {
        for (int diabetes = 0;
            diabetes < homeModel!.problems![problems].diabetes!.length;
            diabetes++) {
          for (int medications = 0;
              medications <
                  homeModel!.problems![problems].diabetes![diabetes]
                      .medications!.length;
              medications++) {
            for (int medicationsClasses = 0;
                medicationsClasses <
                    homeModel!.problems![problems].diabetes![diabetes]
                        .medications![medications].medicationsClasses!.length;
                medicationsClasses++) {
              for (int className2 = 0;
                  className2 <
                      homeModel!
                          .problems![problems]
                          .diabetes![diabetes]
                          .medications![medications]
                          .medicationsClasses![medicationsClasses]
                          .className2!
                          .length;
                  className2++) {
                for (int associatedDrug22 = 0;
                    associatedDrug22 <
                        homeModel!
                            .problems![problems]
                            .diabetes![diabetes]
                            .medications![medications]
                            .medicationsClasses![medicationsClasses]
                            .className![className2]
                            .associatedDrug2!
                            .length;
                    associatedDrug22++) {
                  names.add(homeModel!
                      .problems![problems]
                      .diabetes![diabetes]
                      .medications![medications]
                      .medicationsClasses![medicationsClasses]
                      .className![className2]
                      .associatedDrug2![associatedDrug22]
                      .name);
                  strength.add(homeModel!
                      .problems![problems]
                      .diabetes![diabetes]
                      .medications![medications]
                      .medicationsClasses![medicationsClasses]
                      .className![className2]
                      .associatedDrug2![associatedDrug22]
                      .strength);
                }
                for (int associatedDrug11 = 0;
                    associatedDrug11 <
                        homeModel!
                            .problems![problems]
                            .diabetes![diabetes]
                            .medications![medications]
                            .medicationsClasses![medicationsClasses]
                            .className![className2]
                            .associatedDrug!
                            .length;
                    associatedDrug11++) {
                  names.add(homeModel!
                      .problems![problems]
                      .diabetes![diabetes]
                      .medications![medications]
                      .medicationsClasses![medicationsClasses]
                      .className![className2]
                      .associatedDrug![associatedDrug11]
                      .name);
                  strength.add(homeModel!
                      .problems![problems]
                      .diabetes![diabetes]
                      .medications![medications]
                      .medicationsClasses![medicationsClasses]
                      .className![className2]
                      .associatedDrug![associatedDrug11]
                      .strength);
                }
              }

              for (int className = 0;
                  className <
                      homeModel!
                          .problems![problems]
                          .diabetes![diabetes]
                          .medications![medications]
                          .medicationsClasses![medicationsClasses]
                          .className!
                          .length;
                  className++) {
                for (int associatedDrug2 = 0;
                    associatedDrug2 <
                        homeModel!
                            .problems![problems]
                            .diabetes![diabetes]
                            .medications![medications]
                            .medicationsClasses![medicationsClasses]
                            .className![className]
                            .associatedDrug2!
                            .length;
                    associatedDrug2++) {
                  names.add(homeModel!
                      .problems![problems]
                      .diabetes![diabetes]
                      .medications![medications]
                      .medicationsClasses![medicationsClasses]
                      .className![className]
                      .associatedDrug2![associatedDrug2]
                      .name);
                  strength.add(homeModel!
                      .problems![problems]
                      .diabetes![diabetes]
                      .medications![medications]
                      .medicationsClasses![medicationsClasses]
                      .className![className]
                      .associatedDrug2![associatedDrug2]
                      .strength);
                }
                for (int associatedDrug = 0;
                    associatedDrug <
                        homeModel!
                            .problems![problems]
                            .diabetes![diabetes]
                            .medications![medications]
                            .medicationsClasses![medicationsClasses]
                            .className![className]
                            .associatedDrug!
                            .length;
                    associatedDrug++) {
                  names.add(homeModel!
                      .problems![problems]
                      .diabetes![diabetes]
                      .medications![medications]
                      .medicationsClasses![medicationsClasses]
                      .className![className]
                      .associatedDrug![associatedDrug]
                      .name);
                  strength.add(homeModel!
                      .problems![problems]
                      .diabetes![diabetes]
                      .medications![medications]
                      .medicationsClasses![medicationsClasses]
                      .className![className]
                      .associatedDrug![associatedDrug]
                      .strength);
                }
              }
            }
          }
        }
      }
      print(names.length);
    }).catchError((e) {
      emit(AppCubitErrorState(e));
    });
  }


}

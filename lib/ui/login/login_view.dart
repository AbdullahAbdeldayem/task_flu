import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_flu/cubits/app_cubit/app_cubit.dart';
import 'package:task_flu/cubits/app_cubit/app_cubit_states.dart';
import 'package:task_flu/helpers/cache_helper.dart';
import 'package:task_flu/ui/%D8%A7home/home_view.dart';

import '../../constants/colors.dart';
class emailValidator{
  static String? validator(String v){
    return v.isEmpty ? 'please enter your Email' : null;
  }

}
class passlValidator{
  static String? validator(String v){
    if(v.isEmpty){return  'please enter your password' ;}
    if(v.length < 6 ){return  'password should be at least 6 characters' ;}

  }
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var emailController = TextEditingController();

  var passController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool loading = false;

  String formattedTime = DateFormat.H().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitState>(listener: (context, state) {
      if (state is AppCubitSuccesState) {
        int time = int.parse(formattedTime);
        CacheHelper.PostData(key: 'username', value: emailController.text);
        if (time < 12) {
          showDialog<bool>(
              context: context,
              builder: (context) => Container(
                    width: MediaQuery.of(context).size.width * 1.8,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: AlertDialog(
                      content: Text(
                        'Good morning ${emailController.text}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: orange,
                            fontWeight: FontWeight.w700),
                      ),
                      elevation: 0.1,
                      actions: [
                        Center(
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeView(
                                              name: emailController.text,
                                            )),
                                    (route) => false);
                              },
                              child: Text(
                                'Go to home',
                                style: TextStyle(color: orange),
                              )),
                        ),
                      ],
                    ),
                  ));
        }
        if (time > 12) {
          showDialog<bool>(
              context: context,
              builder: (context) => Container(
                    width: MediaQuery.of(context).size.width * 1.8,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: AlertDialog(
                      content: Text(
                        'Good evening ${emailController.text}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: orange,
                            fontWeight: FontWeight.w700),
                      ),
                      elevation: 0.1,
                      actions: [
                        Center(
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeView(
                                              name: emailController.text,
                                            )),
                                    (route) => false);
                              },
                              child: Text(
                                'Go to home',
                                style: TextStyle(color: orange),
                              )),
                        ),
                      ],
                    ),
                  ));
        }
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
          title: Center(
            child: Text(
              'Flutter Task',
              style: TextStyle(
                  color: orange, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Sign in here',
                  style: TextStyle(
                      color: orange, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 100,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => emailValidator.validator(value!),
                  onFieldSubmitted: (value) {},
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.5)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: orange)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Colors.red.withOpacity(.5))),
                      disabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: orange)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(.5))),
                      errorBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Colors.red.withOpacity(.5)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passController,
                  obscureText: true,
                  validator: (value) => passlValidator.validator(value!),
                  onFieldSubmitted: (value) {},
                  decoration: InputDecoration(
                    hintText: 'password',
                    contentPadding: const EdgeInsets.all(10),
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.5)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: orange)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Colors.red.withOpacity(.5))),
                    disabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: orange)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(.5))),
                    errorBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Colors.red.withOpacity(.5))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (loading == false)
                  MaterialButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();

                      if (formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        AppCubit.get(context).getHomeData();
                      }
                    },
                    child: Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                          color: orange,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: const Center(
                          child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                if (loading == true)
                  CircularProgressIndicator(
                    color: orange,
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}

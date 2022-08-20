abstract class AppCubitState {}

class AppCubitInitialState extends AppCubitState {}

class AppCubitLoadingState extends AppCubitState {}

class AppCubitSuccesState extends AppCubitState {}

class AppCubitErrorState extends AppCubitState {
  final String error;
  AppCubitErrorState(this.error);
}
class AppCubitSignLoadingState extends AppCubitState {}

class AppCubitSignSuccesState extends AppCubitState {}

class AppCubitSignErrorState extends AppCubitState {
  final String error;
  AppCubitSignErrorState(this.error);
}

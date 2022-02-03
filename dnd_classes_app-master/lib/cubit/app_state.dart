part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();

}

class AppInitialState extends AppState {
  @override
  List<Object> get props => [];
}

class AppWelcomeState extends AppState {
  @override
  List<Object> get props => [];
}

class AppLoadingState extends AppState {
  @override
  List<Object> get props => [];
}

class AppLoadedState extends AppState {
  final List classes;
  const AppLoadedState(this.classes);
  @override
  List<Object> get props => [classes];
}

class AppClassesDetailsLoadedState extends AppState {
  final List classes;
  const AppClassesDetailsLoadedState(this.classes);
  @override
  List<Object> get props => [classes];
}

class AppSkillState extends AppState {
  final String skill;
  const AppSkillState(this.skill);
  @override
  List<Object> get props => [skill];
}
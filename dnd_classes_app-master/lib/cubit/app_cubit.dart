import 'package:bloc/bloc.dart';
import 'package:dnd_classes_app/services/data_services.dart';
import 'package:equatable/equatable.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required this.data}) : super(AppInitialState()){
    emit(AppWelcomeState());
  }
  final DataServices data;
  late List classes = [];
  late List classesData = [];
  late String skillsData = '';
  late String checkedData = '';

  void getData() async {
    try{
      if (classes.isEmpty){
        emit(AppLoadingState());
        classes = await data.getInfo();
        emit(AppLoadedState(classes));
      }else {
        emit(AppLoadedState(classes));
      }
    }catch(e) {
      print(e);
    }
  }
  void getClassData(classData, checkedData) async {
    try{
      emit(AppLoadingState());
      classesData = await data.getClassInfo(classData, checkedData);
      emit(AppClassesDetailsLoadedState(classesData));
    }catch(e) {
      print(e);
    }
  }
}

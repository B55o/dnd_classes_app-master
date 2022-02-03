import 'package:dnd_classes_app/cubit/app_cubit.dart';
import 'package:dnd_classes_app/screens/home_screen.dart';
import 'package:dnd_classes_app/screens/skill_desc.dart';
import 'package:dnd_classes_app/screens/skills_screen.dart';
import 'package:dnd_classes_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({ Key? key }) : super(key: key);

  @override
  _AppCubitLogicState createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocBuilder<AppCubit, AppState> (
        builder: (context, state){
          if (state is AppWelcomeState){
            return const WelcomeScreen();

          }if (state is AppLoadedState){
            return const HomeScreen();

          }if (state is AppClassesDetailsLoadedState){
            return const SpellsScreen();

          }if (state is AppSkillState){
            return const SkillDescription();

          }if (state is AppLoadingState){
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.black87,
              ),
            );
          }
           else {
            return Container();
          }
        },
      )
    );
  }
}
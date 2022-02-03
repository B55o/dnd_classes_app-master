import 'package:dnd_classes_app/cubit/app_cubit.dart';
import 'package:dnd_classes_app/widgets/custom_app_bar.dart';
import 'package:dnd_classes_app/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SpellsScreen extends StatelessWidget {
  const SpellsScreen({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: CustomAppBar(
        title: 'SKILLS',
        onPressed: () {
          BlocProvider.of<AppCubit>(context).getData();
        }
        ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state){
          if (state is AppClassesDetailsLoadedState){
            var data = state.classes;
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: data.length,
              itemBuilder: (context, index){
                return GestureDetector(
                onTap: () {
                  //BlocProvider.of<AppCubit>(context).getSkillData(data[index].toString().toLowerCase().trim(), data[index]);
                },
                child: ResponsiveButton(
                  fontSize: 40,
                  buttonText: data[index],
                  width: width*.9,
                  ),
              );
              });
          } else {
            return Container();
          }
        }
        ),
    );
  }
}

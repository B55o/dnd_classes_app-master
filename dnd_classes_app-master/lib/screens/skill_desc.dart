import 'package:dnd_classes_app/cubit/app_cubit.dart';
import 'package:dnd_classes_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SkillDescription extends StatelessWidget {
  const SkillDescription({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'SKILL DETAILS',
        onPressed: () {
          //BlocProvider.of<AppCubit>(context).getClassData('');
        }
        ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state){
          if (state is AppSkillState){
            var data = state.skill;
            return Column(
                children: const [ 
                 Text( 
                   ''
                 ),
                ]
            ); 
          } else {
            return Container();
          }
        }
      )
    );
  }
}
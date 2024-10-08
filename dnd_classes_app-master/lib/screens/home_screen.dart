import 'package:dnd_classes_app/cubit/app_cubit.dart';
import 'package:dnd_classes_app/defaults/defaults.dart';
import 'package:dnd_classes_app/widgets/cards.dart';
import 'package:dnd_classes_app/widgets/custom_app_bar.dart';
import 'package:dnd_classes_app/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(
        title: 'CLASSES',
        ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state){
          double width = MediaQuery.of(context).size.width;
          if (state is AppLoadedState){
            var data = state.classes;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index){
                return Column(
                  children: [
                    CardWidget(
                      txt: '${data[index]}',               
                      imagePath: listOfClassAssets[index],
                    ),
                    Row(
                      children: [
                        ButtonBar(
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        GestureDetector(
                          onTap: () {
                          BlocProvider.of<AppCubit>(context).getClassData(data[index].toString().toLowerCase(), 'proficiency_choices');
                          },
                          child: ResponsiveButton(
                            topMargin: 5.0,
                            bottomMargin: 1.0,
                            fontSize: 14.0,
                            width: width*.3,
                            buttonText: 'SKILL',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                          BlocProvider.of<AppCubit>(context).getClassData(data[index].toString().toLowerCase(), 'proficiencies');
                          },
                          child: ResponsiveButton(
                            topMargin: 5.0,
                            bottomMargin: 1.0,
                            fontSize: 14.0,
                            width: width*.3,
                            buttonText: 'PROFICIENCIES',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubit>(context).getClassData(data[index].toString().toLowerCase(), 'saving_throws');
                          },
                          child: ResponsiveButton(
                            topMargin: 5.0,
                            bottomMargin: 1.0,
                            fontSize: 14.0,
                            width: width*.3,
                            buttonText: 'SAVE THROWS',
                          ),
                        ),
                      ],
                      )
                      ],
                    ),
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubit>(context).getClassData(data[index].toString().toLowerCase(), 'starting_equipment_options');
                              },
                              child: ResponsiveButton(
                                topMargin: 0,
                                bottomMargin: 15.0,
                                fontSize: 14.0,
                                width: width*.3,
                                buttonText: 'STARTING EQ',
                                ),
                            ),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubit>(context).getClassData(data[index].toString().toLowerCase(), 'proficiencies');
                              },
                              child: ResponsiveButton(
                                topMargin: 0,
                                bottomMargin: 15.0,
                                fontSize: 14.0,
                                width: width*.6,
                                buttonText: 'STARTING EQ OPTIONS',
                                ),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 10.0,
                        ),
                  ],
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

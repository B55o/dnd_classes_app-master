import 'package:dnd_classes_app/cubit/app_cubit.dart';
import 'package:dnd_classes_app/defaults/defaults.dart';
import 'package:dnd_classes_app/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: height,
            child: Image.asset(
              listOfBackgroundAssets[0],
              fit: BoxFit.cover,
            ),
          ),
            Positioned(
              top: height*.8,
              left:  width*.25,
              child: GestureDetector(
                onTap: () {
                  BlocProvider.of<AppCubit>(context).getData();
                },
                child: const ResponsiveButton(
                  fontSize: 40,
                  buttonText: 'CLASSES',
                  width: 200,
                  ),
              ),
            ),
        ]
      )
    );
  } 
}  
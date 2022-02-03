import 'package:dnd_classes_app/cubit/app_cubit.dart';
import 'package:dnd_classes_app/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/app_cubit_logic.dart';

void main() {
  runApp(const DndApp());
}

class DndApp extends StatelessWidget {
  const DndApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF424242)),
      debugShowCheckedModeBanner: false,
      home: BlocProvider<AppCubit> (
        create: (context) => AppCubit(
          data: DataServices(),
          ),
        child: const AppCubitLogic() ,
        ),
    );
  }
}

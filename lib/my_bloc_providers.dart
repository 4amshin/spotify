import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';

class MyBlocProviders extends StatelessWidget {
  final Widget child;
  const MyBlocProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
      ],
      child: child,
    );
  }
}

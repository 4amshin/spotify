import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify/data/sources/auth/auth_remote_data_source.dart';
import 'package:spotify/domain/repository/auth/auth_repository.dart';
import 'package:spotify/domain/usecases/auth/sign_in.dart';
import 'package:spotify/domain/usecases/auth/sign_up.dart';
import 'package:spotify/firebase_options.dart';
import 'package:spotify/presentation/auth/bloc/auth_bloc.dart';

part 'init_dependencies.dart';

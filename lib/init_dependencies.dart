part of 'init_dependencies.main.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  _initAuth();
}

void _initAuth() {
  //DataSource
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );

  //Repository
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: serviceLocator(),
    ),
  );

  //UseCases
  serviceLocator.registerFactory(
    () => SignUpUseCase(authRepository: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => SignInUseCase(authRepository: serviceLocator()),
  );

  //Bloc
  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      signUp: serviceLocator(),
      signIn: serviceLocator(),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/common/widgets/loader.dart';
import 'package:spotify/core/assets/assets.gen.dart';
import 'package:spotify/core/utils/build_context_ext.dart';
import 'package:spotify/core/utils/show_snackbar.dart';
import 'package:spotify/data/models/auth/sign_in_user_req.dart';
import 'package:spotify/presentation/auth/bloc/auth_bloc.dart';
import 'package:spotify/presentation/auth/pages/signup_page.dart';
import 'package:spotify/presentation/auth/widgets/auth_bottom_link_text.dart';
import 'package:spotify/presentation/auth/widgets/auth_text_field.dart';
import 'package:spotify/presentation/auth/widgets/auth_title.dart';
import 'package:spotify/presentation/dashboard/pages/dashboard_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showSnackBar(context, state.message, Colors.redAccent);
        } else if (state is AuthSuccess) {
          showSnackBar(context, state.message, Colors.greenAccent);
          context.pushAndRemoveUntil(
            const DashboardPage(),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Loader();
        }
        return Scaffold(
          bottomNavigationBar: const AuthBottomLinkText(
            text: 'Not A Member? ',
            linkText: 'Register Now',
            navigateTo: SignUpPage(),
          ),
          appBar: BasicAppBar(
            title: SvgPicture.asset(
              Assets.vectors.spotifyLogo.path,
              height: 40,
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 30,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AuthTitle(title: 'Sign In'),
                  const SizedBox(height: 50),
                  const SizedBox(height: 10),
                  AuthTextField(
                    controller: _emailController,
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 15),
                  AuthTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                  ),
                  const SizedBox(height: 25),
                  BasicAppButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              SignInEvent(
                                signInUserReq: SignInUserReq(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                ),
                              ),
                            );
                      }
                    },
                    title: 'Sign In',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

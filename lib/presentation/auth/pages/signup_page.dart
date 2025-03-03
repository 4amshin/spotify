import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/assets/assets.gen.dart';
import 'package:spotify/presentation/auth/pages/signin_page.dart';
import 'package:spotify/presentation/auth/widgets/auth_bottom_link_text.dart';
import 'package:spotify/presentation/auth/widgets/auth_text_field.dart';
import 'package:spotify/presentation/auth/widgets/auth_title.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AuthBottomLinkText(
        text: 'Do you have an account? ',
        linkText: 'Sign In',
        navigateTo: SignInPage(),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AuthTitle(title: 'Register'),
            const SizedBox(height: 50),
            AuthTextField(
              controller: _fullName,
              hintText: 'Full Name',
            ),
            const SizedBox(height: 15),
            AuthTextField(
              controller: _email,
              hintText: 'Email',
            ),
            const SizedBox(height: 15),
            AuthTextField(
              controller: _password,
              hintText: 'Password',
            ),
            const SizedBox(height: 25),
            BasicAppButton(
              onPressed: () {},
              title: 'Create Account',
            ),
          ],
        ),
      ),
    );
  }
}

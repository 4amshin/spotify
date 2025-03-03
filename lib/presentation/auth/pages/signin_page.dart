import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/assets/assets.gen.dart';
import 'package:spotify/presentation/auth/pages/signup_page.dart';
import 'package:spotify/presentation/auth/widgets/auth_bottom_link_text.dart';
import 'package:spotify/presentation/auth/widgets/auth_text_field.dart';
import 'package:spotify/presentation/auth/widgets/auth_title.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AuthBottomLinkText(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AuthTitle(title: 'Sign In'),
            const SizedBox(height: 50),
            const SizedBox(height: 10),
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
              title: 'Sign In',
            ),
          ],
        ),
      ),
    );
  }
}

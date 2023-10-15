import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_route/routes.dart';
import '../widget/login_button.dart';
import '../widget/login_form.dart';
import '../widget/navigator_text.dart';
import '../widget/welcom_message.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const WelcomeMessage(text: 'Welcome back'),
            buildSizedBox(),
            const LoginForm(),
            NavigatorText(
              text: 'No account yet?',
              buttonText: 'Register here.',
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.registerScreen),
            ),
            buildSizedBox(),
            const LoginButton(),
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox() {
    return SizedBox(
      height: 20.h,
    );
  }
}

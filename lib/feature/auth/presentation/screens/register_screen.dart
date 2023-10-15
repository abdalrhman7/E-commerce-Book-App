import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_route/routes.dart';
import '../widget/navigator_text.dart';
import '../widget/regiser_button.dart';
import '../widget/register_form.dart';
import '../widget/welcom_message.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 0.1.sh),
                const WelcomeMessage(text: 'Let’s get started!'),
                SizedBox(height: 20.h),
                const RegisterForm(),
                SizedBox(height: 10.h),
                NavigatorText(
                  text: 'Already have an account?',
                  buttonText: 'Login here',
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoutes.loginScreen),
                ),
                SizedBox(height: 10.h),
                const RegisterButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

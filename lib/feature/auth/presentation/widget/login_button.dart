import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_route/routes.dart';
import '../../../../core/widgets/loading_button.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/main_snack_bar.dart';
import '../../business_logic/login_cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) =>  _setBlocListener(context , state),
      builder: (context, state) => _setBlocBuilder(state, context),
    );
  }

  void _setBlocListener(context, state ) {
    if (state is LoginSuccess) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.bottomNavbar,
        (route) => false,
      );
    }
    if (state is LoginError) {
      mainSnackBar(context: context, title: state.errMessage, success: false);
    }
  }

  _setBlocBuilder(state, context) {
    var loginCubit = BlocProvider.of<LoginCubit>(context);
    if (state is LoginLoading) {
      return const LoadingButton();
    }
    return MainButton(
      text: 'Login',
      onTap: () {
        if (loginCubit.formKey.currentState!.validate()) {
          loginCubit.login(
            email: loginCubit.emailController.text,
            password: loginCubit.passwordController.text,
          );
        } else {
          mainSnackBar(
            context: context,
            success: false,
            title: 'please fill all fields',
          );
        }
      },
    );
  }
}

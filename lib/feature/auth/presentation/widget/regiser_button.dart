import 'package:book_store/core/widgets/main_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_route/routes.dart';
import '../../../../core/widgets/loading_button.dart';
import '../../../../core/widgets/main_button.dart';
import '../../business_logic/register_cubit/register_cubit.dart';
import '../../date/model/register_mode.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: _setBlocListener,
      builder: (context, state) => _setBlocBuilder(context, state),
    );
  }

  void _setBlocListener(context, state) {
    if (state is RegisterSuccess) {
      Navigator.pushNamed(
        context,
        AppRoutes.bottomNavbar,
      );
    }
    if (state is RegisterError) {
      mainSnackBar(context: context, title: state.errMessage, success: false);
    }
  }

  _setBlocBuilder(context, state) {
    var registerCubit = BlocProvider.of<RegisterCubit>(context);
    if (state is RegisterLoading) {
      return const LoadingButton();
    }
    return MainButton(
      text: 'Register',
      onTap: () {
        if (registerCubit.formKey.currentState!.validate()) {
          RegisterRequest registerModel = RegisterRequest(
            name: registerCubit.nameController.text,
            email: registerCubit.emailController.text,
            password: registerCubit.passwordController.text,
            passwordConfirmation: registerCubit.passwordConfirmController.text,
          );
          registerCubit.register(registerModel);
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilities/my_validators.dart';
import '../../../../core/widgets/default_text_form_filed.dart';
import '../../business_logic/login_cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          _buildSizedBox(),
          buildEmailTextFormFiled(cubit),
          _buildSizedBox(),
          buildPasswordTextFormFiled(cubit),
          _buildSizedBox(),
        ],
      ),
    );
  }

  Widget buildEmailTextFormFiled(LoginCubit cubit) {
    return DefaultTextFormFiled(
      controller: cubit.emailController,
      label: 'Email',
      hintText: 'Enter Your Email',
      validate: (value) => MyValidators.emailValidator(value),
      type: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildPasswordTextFormFiled(LoginCubit cubit) {
    return DefaultTextFormFiled(
      controller: cubit.passwordController,
      label: 'Password',
      hintText: 'Enter Your Password',
      validate: (value) => MyValidators.passwordValidator(value),
      type: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      isPassword: true,
    );
  }

  SizedBox _buildSizedBox() {
    return SizedBox(
      height: 20.h,
    );
  }
}

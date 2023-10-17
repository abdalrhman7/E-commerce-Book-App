import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilities/my_validators.dart';
import '../../../../core/widgets/default_text_form_filed.dart';
import '../../business_logic/register_cubit/register_cubit.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<RegisterCubit>(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          buildNameTextFormFiled(cubit),
          SizedBox(height: 20.h),
          buildEmailTextFormFiled(cubit),
          SizedBox(height: 20.h),
          buildPasswordTextFormFiled(cubit),
          SizedBox(height: 20.h),
          buildConfirmPasswordTextFormFiled(cubit),
        ],
      ),
    );
  }

  Widget buildNameTextFormFiled(RegisterCubit cubit) {
    return DefaultTextFormFiled(
      controller: cubit.nameController,
      label: 'Name',
      hintText: 'Enter Your Name',
      validate: (value) => MyValidators.nameValidator(value),
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildEmailTextFormFiled(RegisterCubit cubit) {
    return DefaultTextFormFiled(
      controller: cubit.emailController,
      label: 'Email',
      hintText: 'Enter Your Email',
      validate: (value) => MyValidators.emailValidator(value),
      type: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildPasswordTextFormFiled(RegisterCubit cubit) {
    return DefaultTextFormFiled(
      controller: cubit.passwordController,
      label: 'Password',
      hintText: 'Enter Your Password',
      validate: (value) => MyValidators.passwordValidator(value),
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildConfirmPasswordTextFormFiled(RegisterCubit cubit) {
    return DefaultTextFormFiled(
      controller: cubit.passwordConfirmController,
      label: 'Confirm Password',
      hintText: 'Re Enter Your Password',
      validate: (value) => MyValidators.repeatPasswordValidator(
          password: cubit.passwordController.text, value: value),
      textInputAction: TextInputAction.done,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/my_validators.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/widgets/CustomCircularProgressIndicator.dart';
import '../../../../core/widgets/default_text_form_filed.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/main_snack_bar.dart';
import '../../business_logic/update_profile_cubit/update_profile_cubit.dart';
import '../../data/model/profile_info.dart';

class UpdateProfileInfoScreen extends StatefulWidget {
  const UpdateProfileInfoScreen({super.key});

  @override
  State<UpdateProfileInfoScreen> createState() =>
      _UpdateProfileInfoScreenState();
}

class _UpdateProfileInfoScreenState extends State<UpdateProfileInfoScreen> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _cityController;
  late TextEditingController _addressController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _cityController = TextEditingController();
    _addressController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<UpdateProfileCubit>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Update details!",
                      style: Style.textStyle32,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Update your info and become a new you !",
                    textAlign: TextAlign.center,
                    style: Style.textStyle22.copyWith(
                        color: Colors.grey, overflow: TextOverflow.fade),
                  ),
                  SizedBox(height: 20.h),
                  buildNameTextFormFiled(),
                  SizedBox(height: 20.h),
                  buildPhoneTextFormFiled(),
                  SizedBox(height: 20.h),
                  buildCityTextFormFiled(),
                  SizedBox(height: 20.h),
                  buildAddressTextFormFiled(),
                  SizedBox(height: 0.22.sh),
                  buildBlocConsumerMainButton(cubit)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNameTextFormFiled() {
    return DefaultTextFormFiled(
      controller: _nameController,
      label: 'Name',
      hintText: 'Enter Your Name',
      validate: (value) => MyValidators.nameValidator(value),
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildPhoneTextFormFiled() {
    return DefaultTextFormFiled(
      controller: _phoneController,
      label: 'Phone',
      validate: (value) => MyValidators.phoneValidator(value),
      type: TextInputType.phone,
      textInputAction: TextInputAction.next,
    );
  }

  DefaultTextFormFiled buildCityTextFormFiled() {
    return DefaultTextFormFiled(
      controller: _cityController,
      label: 'city',
      validate: (value) => MyValidators.nameValidator(value),
      textInputAction: TextInputAction.next,
    );
  }

  DefaultTextFormFiled buildAddressTextFormFiled() {
    return DefaultTextFormFiled(
      controller: _addressController,
      label: 'address',
      validate: (value) => MyValidators.nameValidator(value),
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildBlocConsumerMainButton(UpdateProfileCubit cubit) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileError) {
          mainSnackBar(
              context: context, title: state.errorMessage, success: false);
        }
        if (state is UpdateProfileSuccess) {
          mainSnackBar(context: context, title: 'Success', success: true);
        }
      },
      builder: (context, state) {
        if (State is UpdateProfileLoading) {
          return const CustomCircularProgressIndicator();
        }
        return MainButton(
          text: 'Update Profile',
          onTap: () {
            submitUpdateProfile(cubit);
          },
        );
      },
    );
  }

  void submitUpdateProfile(UpdateProfileCubit cubit) {
    ProfileInfoModel registerModel = ProfileInfoModel(
      name: _nameController.text,
      phone: _phoneController.text,
      address: _addressController.text,
      city: _cityController.text,
    );
    cubit.updateUserInfo(registerModel);
  }
}

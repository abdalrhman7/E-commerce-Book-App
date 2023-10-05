import 'package:book_store/core/app_route/routes.dart';
import 'package:book_store/core/widgets/main_dialog.dart';
import 'package:book_store/feature/auth/business_logic/logout_cubit/logout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/show_progress_indicator_alert_dialog.dart';

class LogoutButtonBlocListener extends StatelessWidget {
  const LogoutButtonBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Navigator.of(context, rootNavigator: true)
              .pushNamedAndRemoveUntil(AppRoutes.loginScreen, (route) => false);
        }
        if (state is LogoutError) {
          MainDialog(
            context: context,
            title: 'Error',
            content: state.errMessage,
          );
        }
        if (state is LogoutLoading) {
          showProgressIndicatorAlertDialog(context);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () => BlocProvider.of<LogoutCubit>(context).logout(),
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
    );
  }
}

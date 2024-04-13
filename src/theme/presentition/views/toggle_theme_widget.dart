import 'package:flutter_useable_widget_and_classes/core/services/injection_container_imports.dart';
import 'package:flutter_useable_widget_and_classes/core/utils/app_utls.dart';
import 'package:flutter_useable_widget_and_classes/src/theme/presentition/cubit/theme_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleThemeWidget extends StatelessWidget {
  const ToggleThemeWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ThemeControllerCubit>()..getCurrentTheme(),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: SafeArea(
          child: Stack(
            children: [
              child,
              BlocConsumer<ThemeControllerCubit, ThemeControllerState>(
                listener: (context, state) {
                  if (state is ThemeErorr) {
                    AppUtils.showSnackBar(
                      context: context,
                      message: state.message,
                    );
                  }
                },
                builder: (context, state) {
                  return Positioned(
                    right: 0,
                    top: 0,
                    child: IconButton(
                      icon: Icon(
                        context.read<ThemeControllerCubit>().isDark
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                      iconSize: 32,
                      color: context.read<ThemeControllerCubit>().isDark
                          ? Colors.white
                          : Colors.black,
                      onPressed: () {
                        context.read<ThemeControllerCubit>().toggleTheme();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

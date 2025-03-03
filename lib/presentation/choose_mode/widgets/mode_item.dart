import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';

class ModeItem extends StatelessWidget {
  final String assetPath;
  final void Function()? onTap;
  final String text;
  final ThemeMode mode;
  const ModeItem({
    super.key,
    required this.assetPath,
    this.onTap,
    required this.text,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, currentTheme) {
        final bool isSelected = currentTheme == mode;

        return Column(
          children: [
            GestureDetector(
              onTap: onTap,
              child: ClipOval(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10,
                    sigmaY: 10,
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: isSelected ? 80 : 70,
                    width: isSelected ? 80 : 70,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary
                          : const Color(0xff30393C).withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      fit: BoxFit.none,
                      assetPath,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: isSelected ? 17 : 15,
                color: isSelected ? Colors.white : AppColors.grey,
              ),
              child: Text(text),
            )
          ],
        );
      },
    );
  }
}

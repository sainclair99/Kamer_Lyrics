import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kamer_lyrics/shared/utils/app_colors.dart';

class SubmitButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final bool loading;
  final Function()? onPressed;

  const SubmitButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.width,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed, //TODO : submit connection
      child: Container(
        alignment: Alignment.center,
        width: width ?? 110,
        height: height ?? 55,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(70, 192, 50, 1),
          border: Border.all(width: 1, color: Colors.green),
          borderRadius: BorderRadius.circular(50),
        ),
        child: loading
            ? CupertinoActivityIndicator(
              color: AppColors.secondaryColor,
            )
            : Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}

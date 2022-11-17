import 'package:flutter/material.dart';

class BaseButton extends SizedBox {
  BaseButton({
    super.key,
    required String label,
    double? width = double.infinity,
    double? height = 30,
    ButtonStyle? buttonStyle,
    TextStyle? textStyle,
    VoidCallback? onPressed,
  }) : super(
          width: width,
          height: height,
          child: ElevatedButton(
            onPressed: onPressed,
            style: buttonStyle,
            child: Text(
              label,
              style: textStyle,
            ),
          ),
        );
}

class ButtonBlue extends BaseButton {
  ButtonBlue({
    super.key,
    required String label,
    VoidCallback? onPressed,
    double? height = 30,
  }) : super(
          label: label,
          height: height,
          onPressed: onPressed,
          buttonStyle: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 87, 154, 226),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
}

class ButtonBlueInverted extends BaseButton {
  ButtonBlueInverted({
    super.key,
    required String label,
    VoidCallback? onPressed,
    double? height = 30,
  }) : super(
          label: label,
          height: height,
          onPressed: onPressed,
          buttonStyle: ElevatedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 87, 154, 226),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(
                color: Color.fromARGB(255, 87, 154, 226),
                width: 2,
              ),
            ),
          ),
        );
}

class ButtonRed extends BaseButton {
  ButtonRed({
    super.key,
    required String label,
    VoidCallback? onPressed,
    double? height = 30,
  }) : super(
          label: label,
          height: height,
          onPressed: onPressed,
          buttonStyle: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 255, 75, 75),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
}

class ButtonRedInverted extends BaseButton {
  ButtonRedInverted({
    super.key,
    required String label,
    VoidCallback? onPressed,
    double? height = 30,
  }) : super(
          label: label,
          height: height,
          onPressed: onPressed,
          buttonStyle: ElevatedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 255, 75, 75),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(
                color: Color.fromARGB(255, 255, 75, 75),
              ),
            ),
          ),
        );
}

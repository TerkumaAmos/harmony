import 'package:flutter/material.dart';
import 'package:harmony_hush/core/theme/app_colors.dart';

enum InputType { email, text, password }

class HarmonyInput extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController? confirmAgainst;
  final InputType type;
  final String? labelText;
  final String? hintText;
  final String? topLabel;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final bool readOnly;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  const HarmonyInput({
    super.key,
    required this.controller,
    this.confirmAgainst,
    this.type = InputType.text,
    this.labelText,
    this.hintText,
    this.validator,
    this.topLabel,
    this.onChanged,
    this.textInputAction,
    this.autofocus = false,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines,
    this.minLines,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
  });

  @override
  State<HarmonyInput> createState() => _HarmonyInputState();
}

class _HarmonyInputState extends State<HarmonyInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final isPassword = widget.type == InputType.password;

    final inputField = SizedBox(
      width: 360,
      height: 60, // Increased height from 51 to 60
      child: TextFormField(
        controller: widget.controller,
        obscureText: isPassword ? _obscureText : false,
        style: TextStyle(
          color: AppColors.inputText,
          fontSize: 16, // Increased from 12 to 16
        ),
        decoration: InputDecoration(
          hintText: widget.hintText, // Use hintText only
          prefixIcon: widget.prefixIcon,
          suffixIcon: _getSuffixIcon(),
          filled: true,
          fillColor: AppColors.inputBackground,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(
            color: AppColors.inputText.withOpacity(0.7),
            fontSize: 16, // Increased from 18 to match style
          ),
          errorStyle: TextStyle(
            color: Colors.redAccent,
            fontSize: 12,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(color: AppColors.backgroundgreen, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(color: Colors.redAccent, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(color: Colors.redAccent, width: 2),
          ),
        ),
        keyboardType: widget.keyboardType ?? _getKeyboardType(),
        textInputAction: widget.textInputAction ?? _getTextInputAction(),
        autofocus: widget.autofocus,
        readOnly: widget.readOnly,
        enabled: widget.enabled,
        maxLines: isPassword ? 1 : widget.maxLines,
        minLines: widget.minLines,
        autocorrect: !isPassword,
        enableSuggestions: !isPassword,
        validator: widget.validator ?? _getDefaultValidator(),
        onChanged: widget.onChanged,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: widget.topLabel != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.topLabel!,
                  style: TextStyle(fontSize: 14, color: AppColors.textgreen),
                ),
                const SizedBox(height: 8),
                inputField,
              ],
            )
          : inputField,
    );
  }

  Widget? _getSuffixIcon() {
    if (widget.suffixIcon != null) return widget.suffixIcon;

    if (widget.type == InputType.password) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: AppColors.inputText,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    }

    return null;
  }

  TextInputType _getKeyboardType() {
    return widget.keyboardType ??
        (widget.type == InputType.email
            ? TextInputType.emailAddress
            : TextInputType.text);
  }

  TextInputAction _getTextInputAction() {
    return widget.textInputAction ??
        (widget.type == InputType.password
            ? TextInputAction.done
            : TextInputAction.next);
  }

  String? Function(String?)? _getDefaultValidator() {
    if (widget.validator != null) return widget.validator;

    switch (widget.type) {
      case InputType.email:
        return (value) {
          if (value == null || value.isEmpty) {
            return 'Email is required';
          }
          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
          if (!emailRegex.hasMatch(value)) {
            return 'Enter a valid email';
          }
          return null;
        };
      case InputType.password:
        if (widget.confirmAgainst != null) {
          return (value) {
            if (value == null || value.isEmpty) {
              return 'Confirm password is required';
            }
            if (value != widget.confirmAgainst!.text) {
              return 'Passwords do not match';
            }
            return null;
          };
        }
        return (value) {
          if (value == null || value.isEmpty) {
            return 'Password is required';
          }
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        };
      default:
        return null;
    }
  }
}
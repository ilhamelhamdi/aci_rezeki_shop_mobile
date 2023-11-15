import 'package:flutter/material.dart';
import 'package:aci_rezeki_shop_mobile/features/main/presentation/widget/input_text_field.dart';

class InputNumberField extends InputTextField {
  InputNumberField({
    Key? key,
    required String name,
    required ValueChanged<String> onChanged,
    FormFieldValidator? validator,
  }) : super(
          key: key,
          name: name,
          onChanged: onChanged,
          validator: (String? value) {
            if (int.tryParse(value!) == null) {
              return "$name must be a number!";
            }
            return validator == null ? null : validator(value);
          },
        );
}

import 'package:book_store/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/governorates_model.dart';

class DropDownMenuWidget extends StatelessWidget {
  final void Function(String? value) onChanged;
  final List<GovernoratesModel> governorates;
  final String hint;
  final String? value;
  const DropDownMenuWidget({
    Key? key,
    required this.onChanged,
    required this.governorates,
    required this.hint,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(12.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(12.w),
        ),
      ),
      icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
      isExpanded: true,
      elevation: 16,
      dropdownColor: Colors.white,
      style: Style.textStyle14
          .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
      hint: FittedBox(
        child: Text(
          hint,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
      onChanged: onChanged,
      items: governorates.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value.id!.toString(),
          child: Text(value.governorateNameEn!),
        );
      }).toList(),
    );
  }
}

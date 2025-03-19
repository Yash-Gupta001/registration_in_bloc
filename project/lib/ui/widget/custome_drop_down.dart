// core/ui/widget/custome_drop_down.dart
import 'package:flutter/material.dart';
import 'package:rfc_cc/app/utils/color_config.dart';
import 'package:rfc_cc/custom_package/custom_dropdown_textfield/dropdown_textfield.dart';


// ignore: must_be_immutable
class CustomeDropDown extends StatelessWidget {
  DropDownValueModel? model;
  List<DropDownValueModel> dropdownArrary = [];
  Function(dynamic value) onChanged;
  bool clearOption;
  bool enableSearch;
  Color fillColor;
  Color borderColor;
  bool isEnabled;
  bool isMandatory;
  bool isLabelRequired;
  String labelText;
  bool isVisible;
  int marginTop;
  String? Function(dynamic value)? validator;

  CustomeDropDown(
      {super.key,
      required this.model,
      required this.dropdownArrary,
      required this.onChanged,
      this.clearOption = false,
      this.enableSearch = false,
      this.isEnabled = true,
      this.fillColor = Colors.white,
      this.borderColor = Colors.grey,
      this.isMandatory = false,
      this.isLabelRequired = false,
      this.labelText = '',
      this.validator,
      this.marginTop = 0,
      this.isVisible = true}); // Default value set to true

  @override
  Widget build(BuildContext context) {
    if (!isVisible) {
      return const SizedBox.shrink(); // Return empty widget if not visible
    }

    return Container(
      margin: EdgeInsets.only(top: marginTop.toDouble()),
      child: Column(
        children: [
          if (isLabelRequired)
            Row(
              children: [
                if (isMandatory)
                  Text(
                    "*",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorConfig.redColor,
                        ),
                  ),
                Flexible(
                  child: Text(
                    labelText,
                    style: Theme.of(context).textTheme.titleMedium!,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 4),
          DropDownTextField(
            controller: SingleValueDropDownController(
              data: model,
            ),
            clearOption: false,
            listTextStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(overflow: TextOverflow.ellipsis),

            textStyle: Theme.of(context).textTheme.titleSmall!,
            searchTextStyle: Theme.of(context).textTheme.titleSmall!,
            // Hide the clear option
            enableSearch: enableSearch, // Disable search if not needed
            dropDownItemCount: dropdownArrary.length > 6
                ? 6
                : dropdownArrary.length, // Limit dropdown list height
            isEnabled: isEnabled, // Disable the dropdown
            textFieldDecoration: InputDecoration(
              filled: true,
              fillColor: fillColor,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: borderColor, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: borderColor, width: 0.5), // Border when enabled
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0), // Border when focused
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                    color: Colors.red, width: 1.0), // Border when error
              ),
            ),
            dropDownList: dropdownArrary,
            validator: validator,
            onChanged: (value) {
              if (value is DropDownValueModel) {
                onChanged(value);
              }
            },
          ),
        ],
      ),
    );
  }
}

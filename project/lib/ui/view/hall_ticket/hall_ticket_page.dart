import 'package:flutter/material.dart';
import 'package:rfc_cc/custom_package/custom_dropdown_textfield/dropdown_textfield.dart';
import 'package:rfc_cc/ui/widget/custome_drop_down.dart';

class HallTicketPage extends StatefulWidget {
  const HallTicketPage({super.key});

  @override
  State<HallTicketPage> createState() => _HallTicketPageState();
}

class _HallTicketPageState extends State<HallTicketPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();

  String initalValue = "abc";
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomeDropDown(
                  dropdownArrary: const [
                    DropDownValueModel(name: 'name1', value: "value1"),
                    DropDownValueModel(
                        name:
                            'name2 DropDownButton is a widget that we can use to select one unique value from a set of values   DropDownButton is a widget that we can use to select one unique value from  Pranay end',
                        value: "value2",
                        toolTipMsg:
                            "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                    DropDownValueModel(name: 'name3', value: "value3"),
                    DropDownValueModel(
                        name: 'name4',
                        value: "value4",
                        toolTipMsg:
                            "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                    DropDownValueModel(name: 'name5', value: "value5"),
                    DropDownValueModel(name: 'name6', value: "value6"),
                    DropDownValueModel(name: 'name7', value: "value7"),
                    DropDownValueModel(name: 'name8', value: "value8"),
                  ],
                  onChanged: (val) {},
                  model: const DropDownValueModel(name: 'name1', value: "value1"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

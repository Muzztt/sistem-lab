import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QDatePicker extends StatefulWidget {
  final String label;
  final DateTime? value;
  final String? hint;
  final String? Function(String?)? validator;
  final Function(DateTime) onChanged;
  final BorderRadius? borderRadius;

  const QDatePicker({
    Key? key,
    required this.label,
    this.value,
    this.validator,
    this.hint,
    required this.onChanged,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<QDatePicker> createState() => _QDatePickerState();
}

class _QDatePickerState extends State<QDatePicker> {
  DateTime? selectedValue;
  late TextEditingController controller;
  late Key fieldKey;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
    controller = TextEditingController(
      text: getInitialValue(),
    );
  }

  getInitialValue() {
    if (widget.value != null) {
      return DateFormat("d MMM y").format(widget.value!);
    }
    return "-";
  }

  getFormattedValue() {
    if (selectedValue != null) {
      return DateFormat("d MMM y").format(selectedValue!);
    }
    return "-";
  }

  void reset() {
    selectedValue = null;
    controller.clear(); // Clear nilai pada controller
    fieldKey = UniqueKey(); // Ubah kunci untuk membuat TextFormField di-rebuild
    setState(() {}); // Panggil setState agar widget di-rebuild
    widget.onChanged(selectedValue!); // Panggil onChanged dengan nilai baru
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        selectedValue = pickedDate;
        controller.text = getFormattedValue();
        setState(() {});

        widget.onChanged(selectedValue!);
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          validator: (value) {
            if (widget.validator != null) {
              return widget.validator!(selectedValue.toString());
            }
            return null;
          },
          maxLength: 20,
          readOnly: true,
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: const TextStyle(
              color: Colors.blueGrey,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(4.0),
              borderSide: const BorderSide(
                color: Colors.blueGrey,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(4.0),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(4.0),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            suffixIcon: const Icon(
              Icons.date_range,
            ),
            helperText: widget.hint,
          ),
        ),
      ),
    );
  }
}

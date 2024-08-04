import 'package:flutter/material.dart';

class EditSubDialog extends StatefulWidget {
  final Function(List) onConfirm;

  const EditSubDialog({
    super.key,
    required this.onConfirm,
  });

  @override
  State<EditSubDialog> createState() => _EditSubDialogState();
}

class _EditSubDialogState extends State<EditSubDialog> {
  final TextEditingController _AttendController = TextEditingController();
  final TextEditingController _TotalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Edit Attendance',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface, fontSize: 30),
          ),
          const SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 30,
            ),
            controller: _AttendController,
            decoration: const InputDecoration(
                hintText: 'Attended',
                hintStyle: TextStyle(
                  fontSize: 20,
                )),
          ),
          TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 30,
            ),
            controller: _TotalController,
            decoration: const InputDecoration(
              hintText: 'Total',
              hintStyle: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Theme.of(context).colorScheme.error,
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  if (int.parse(_AttendController.text) <=
                          int.parse(_TotalController.text) &&
                      int.parse(_TotalController.text) != 0) {
                    List<dynamic> editsub = [
                      int.parse(_AttendController.text),
                      int.parse(_TotalController.text),
                    ];
                    widget.onConfirm(editsub);
                    Navigator.pop(context);
                  }
                },
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Theme.of(context).colorScheme.onSurface,
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

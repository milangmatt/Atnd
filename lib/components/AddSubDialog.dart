import 'package:flutter/material.dart';

class AddSubDialog extends StatefulWidget {
  final Function(List) onConfirm;
  const AddSubDialog({super.key, required this.onConfirm,});

  @override
  State<AddSubDialog> createState() => _AddSubDialogState();
}

class _AddSubDialogState extends State<AddSubDialog> {
  final TextEditingController _SubAbbrController = TextEditingController();
  final TextEditingController _SubNameController = TextEditingController();

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
            'Add Subject',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface, fontSize: 30),
          ),
          const SizedBox(height: 20),
          TextField(
            maxLength: 3,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            controller: _SubAbbrController,
            decoration: const InputDecoration(
                hintText: 'Subject Abbreviation',
                hintStyle: TextStyle(
                  fontSize: 20,
                )),
          ),
          TextField(
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            controller: _SubNameController,
            decoration: const InputDecoration(
              hintText: 'Subject Name',
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
                  List<dynamic> newsub = [
                    _SubAbbrController.text.toUpperCase(),
                    _SubNameController.text,
                    1,
                    1
                  ];
                  widget.onConfirm(newsub);
                  Navigator.pop(context);
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

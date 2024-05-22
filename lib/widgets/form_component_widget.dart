import 'package:flutter/material.dart';
import 'package:marbles_health_assignment/form_state_service.dart';


class FormComponentWidget extends StatefulWidget {
  final FormComponent component;
  final VoidCallback onRemove;
  final ValueChanged<FormComponent> onUpdate;

  const FormComponentWidget({
    Key? key,
    required this.component,
    required this.onRemove,
    required this.onUpdate,
  }) : super(key: key);

  @override
  _FormComponentWidgetState createState() => _FormComponentWidgetState();
}

class _FormComponentWidgetState extends State<FormComponentWidget> {
  late TextEditingController _labelController;
  late TextEditingController _infoTextController;
  late bool _required;
  late bool _readonly;
  late bool _hidden;

  @override
  void initState() {
    super.initState();
    _labelController = TextEditingController(text: widget.component.label);
    _infoTextController = TextEditingController(text: widget.component.infoText);
    _required = widget.component.required;
    _readonly = widget.component.readonly;
    _hidden = widget.component.hidden;
  }

  @override
  void dispose() {
    _labelController.dispose();
    _infoTextController.dispose();
    super.dispose();
  }

  void _updateComponent() {
    widget.onUpdate(FormComponent(
      label: _labelController.text,
      infoText: _infoTextController.text,
      required: _required,
      readonly: _readonly,
      hidden: _hidden,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _labelController,
              decoration: InputDecoration(labelText: 'Label'),
              onChanged: (_) => _updateComponent(),
            ),
            TextField(
              controller: _infoTextController,
              decoration: InputDecoration(labelText: 'Info-Text'),
              onChanged: (_) => _updateComponent(),
            ),
            Row(
              children: [
                Checkbox(
                  value: _required,
                  onChanged: (value) {
                    setState(() {
                      _required = value!;
                    });
                    _updateComponent();
                  },
                ),
                Text('Required'),
                Checkbox(
                  value: _readonly,
                  onChanged: (value) {
                    setState(() {
                      _readonly = value!;
                    });
                    _updateComponent();
                  },
                ),
                Text('Readonly'),
                Checkbox(
                  value: _hidden,
                  onChanged: (value) {
                    setState(() {
                      _hidden = value!;
                    });
                    _updateComponent();
                  },
                ),
                Text('Hidden'),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: widget.onRemove,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

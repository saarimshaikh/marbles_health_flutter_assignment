import 'package:flutter/foundation.dart';

class FormComponent {
  String label;
  String infoText;
  bool required;
  bool readonly;
  bool hidden;

  FormComponent({
    required this.label,
    required this.infoText,
    this.required = false,
    this.readonly = false,
    this.hidden = false,
  });
}

class FormStateService with ChangeNotifier {
  List<FormComponent> components = [
    FormComponent(label: '', infoText: ''),
  ];

  List<FormComponent> submittedComponents = [];

  void addComponent() {
    components.add(FormComponent(label: '', infoText: ''));
    notifyListeners();
  }

  void removeComponent(int index) {
    if (components.length > 1) {
      components.removeAt(index);
      notifyListeners();
    }
  }

  void updateComponent(int index, FormComponent component) {
    components[index] = component;
    notifyListeners();
  }

  void submitForm() {
    submittedComponents = List.from(components);
    notifyListeners();
  }
}

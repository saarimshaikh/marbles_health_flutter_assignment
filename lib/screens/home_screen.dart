import 'package:flutter/material.dart';
import 'package:marbles_health_assignment/form_state_service.dart';
import 'package:marbles_health_assignment/widgets/form_component_widget.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formState = Provider.of<FormStateService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Marbles Health'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: formState.submitForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: formState.components.length,
                itemBuilder: (context, index) {
                  final component = formState.components[index];
                  return FormComponentWidget(
                    key: ValueKey(index),
                    component: component,
                    onRemove: () => formState.removeComponent(index),
                    onUpdate: (updatedComponent) => formState.updateComponent(index, updatedComponent),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: formState.addComponent,
              child: Text('ADD'),
            ),
          ],
        ),
      ),
    );
  }
}

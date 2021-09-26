import 'package:borderhacks/enums/view_state.dart';
import 'package:borderhacks/ui/components/text_field/custom_textfield.dart';
import 'package:borderhacks/ui/views/base_view.dart';
import 'package:borderhacks/viewmodels/input_form_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    void pickTime(
        InputFormViewModel model, DateTime initialtime, String command) async {
      var time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
          hour: initialtime.hour,
          minute: initialtime.minute,
        ),
      );
      if (time != null) {
        model.setTime(time, command);
      }
    }

    return BaseView<InputFormViewModel>(
      onModelReady: (model) => model.onModelReady(),
      onModelDestroy: (model) => model.onModelDestroy(),
      builder: (context, model, child) => model.state == ViewState.Busy
          ? Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                title: Center(
                  child: Text('General Information'),
                ),
              ),
              body: Form(
                key: model.formKey,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomTextField(
                        controller: model.nameController,
                        label: 'Name',
                        prefix: Icon(Icons.person),
                        hint: 'Enter your Name',
                        validator: model.validateTextField,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomTextField(
                        controller: model.qualificationController,
                        label: 'Qualification',
                        prefix: Icon(Icons.school),
                        hint: 'Enter your Qualification',
                        validator: model.validateTextField,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomTextField(
                        controller: model.specializationController,
                        label: 'Specialization',
                        prefix: Icon(Icons.flag),
                        hint: 'Enter your specialization',
                        validator: model.validateTextField,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomTextField(
                        controller: model.appointmentfeeController,
                        label: 'Appointment Fee',
                        prefix: Icon(Icons.paid),
                        validator: model.validateTextField,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Timing: ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: w / 10,
                        ),
                        SizedBox(
                          width: w / 3,
                          child: Card(
                            child: ListTile(
                              onTap: () => pickTime(model, model.from, 'from'),
                              title: Text('From'),
                              subtitle:
                                  Text(DateFormat.jm().format(model.from)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w / 3,
                          child: Card(
                            child: ListTile(
                              onTap: () => pickTime(model, model.to, 'to'),
                              title: Text('To'),
                              subtitle: Text(DateFormat.jm().format(model.to)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomTextField(
                        controller: model.addressController,
                        label: 'Address',
                        prefix: Icon(Icons.room),
                        hint: 'Enter the clinic address',
                        validator: model.validateTextField,
                        maxlines: 3,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          onPressed: () async {
                            if (model.formKey.currentState!.validate()) {
                              await model.setInfo();
                            }
                          },
                          color: Colors.blue,
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

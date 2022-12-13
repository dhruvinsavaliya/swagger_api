// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swagger_api/api/model/req_model/TaskReqModel.dart';
import 'package:swagger_api/api/model/res_model/TaskResModel.dart';
import 'package:swagger_api/view/HomeScreen.dart';

import '../api/repo/create_task_repo.dart';
import '../common/common_method/show_snackbar_method.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({Key? key}) : super(key: key);

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  TaskReqModel reqModel = TaskReqModel();
  TextEditingController noteTitleController = TextEditingController();
  TextEditingController noteContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (noteTitleController.text.isNotEmpty &&
            noteContentController.text.isNotEmpty) {
          reqModel.noteTitle = noteTitleController.text;
          reqModel.noteContent = noteContentController.text;

          await CreateTaskRepo.createTaskRepo(reqBody: reqModel.toJson()).then(
            (value) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            ),
          );
        }

        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create Task"),
          centerTitle: true,
        ),
        body: Column(
          children: [

            TextFormField(
              controller: noteTitleController,
              maxLength: 50,
              decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            TextFormField(
              controller: noteContentController,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              decoration: InputDecoration(
                  hintText: "note",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ],
        ),
      ),
    );
  }
}

///
// onWillPop: () async {
// if(formKey.currentState!.validate())
// {
// reqModel.noteTitle = noteTitleController.text;
// reqModel.noteContent = noteContentController.text;
//
// bool? status = await CreateTaskRepo.createTaskRepo(reqBody: reqModel.toJson());
// log("=================${status}");
// if(status == true)
// {
// Navigator.pop(context, true);
//
// }
// else{
// Navigator.pop(context,true);
// }
// }
//
//
// },

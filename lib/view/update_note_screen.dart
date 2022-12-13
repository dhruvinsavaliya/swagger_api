// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swagger_api/api/model/req_model/TaskReqModel.dart';
import 'package:swagger_api/view/HomeScreen.dart';

import '../api/repo/create_task_repo.dart';
import '../api/repo/update_task_repo.dart';

class UpdateNoteScreen extends StatefulWidget {
   UpdateNoteScreen({Key? key, required this.noteTitle, required this.noteContent, required this.id}) : super(key: key);
  final String noteTitle;
  final String noteContent;
  final String id;
  @override
  State<UpdateNoteScreen> createState() => _UpdateNoteScreenState();
}

class _UpdateNoteScreenState extends State<UpdateNoteScreen> {
  final formKey = GlobalKey<FormState>();
  TaskReqModel reqModel= TaskReqModel();
  TextEditingController? noteTitleController ;
  TextEditingController? noteContentController;

  @override
  void initState() {
     String noteTitle = widget.noteTitle;
     String noteContent = widget.noteContent;
     String id = widget.id;
     noteTitleController = TextEditingController(text: noteTitle);
     noteContentController = TextEditingController(text: noteContent);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: const Text("Update Task"), centerTitle: true, ),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    if(formKey.currentState!.validate())
                    {
                      reqModel.noteTitle = noteTitleController!.text;
                      reqModel.noteContent = noteContentController!.text;
                      log("====>${reqModel.toJson()}");
                      String message = await UpdateTaskRepo.updateTaskRepo(reqBody: reqModel.toJson(),id: widget.id);

                      if(message == "Note Updated")
                      {
                        ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(message),),).closed.then((value) =>  Navigator.push(context,MaterialPageRoute(builder: (context) => const HomeScreen(),),),);

                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(message)));
                      }
                    }
                  }, child: const Text('save')),
              TextFormField(
                controller: noteTitleController,
                maxLength: 50,

                decoration: InputDecoration
                  (
                    hintText: "Title",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            20))),
              ),
              TextFormField(

                controller: noteContentController,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: InputDecoration
                  (
                    hintText: "note",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            20))),
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


import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:swagger_api/api/repo/get_notes_repo.dart';
import 'package:swagger_api/view/create_note_screen.dart';
import 'package:swagger_api/view/update_note_screen.dart';

import '../api/model/res_model/TaskResModel.dart';
import '../api/repo/delete_task_repo.dart';
import '../api/repo/get_all_task_repo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await GetAllTaskRepo.getAllTaskRepo();
        },
        child: FutureBuilder<List<TaskResModel>>(
          future: GetAllTaskRepo.getAllTaskRepo(),
          builder: (context, AsyncSnapshot<List<TaskResModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 3),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data![index];
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                       DeleteNoteRepo.deleteTaskRepo(id: data.noteID);
                    },
                    child: GestureDetector(
                      onTap: () async {
                        TaskResModel? res =
                            await GetTaskRepo.getTaskRepo(id: data.noteID!);


                        log('====${res!.noteContent}');

                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return UpdateNoteScreen(
                              id: data.noteID.toString(),
                              noteContent: res.noteContent!,
                              noteTitle: data.noteTitle.toString(),
                            );
                          },
                        ));
                      },
                      child: Container(
                        height: 100,
                        width: 50,
                        child: Column(children: [
                          Text(
                            "${data.noteTitle}",
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          // Text(
                          //   "${data.noteContent}",
                          //   style:
                          //       const TextStyle(fontSize: 15, color: Colors.grey),
                          // ),
                        ]),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateNoteScreen(),
              ));
        },
        child: const Icon(Icons.create_outlined),
      ),
    );
  }
}

import 'package:autogpt/components/bookmate/bookmate.model.dart';
import 'package:autogpt/components/bookmate/screenview.component.dart';
import 'package:autogpt/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Bookmate extends StatefulWidget {
  const Bookmate({super.key});

  @override
  State<Bookmate> createState() => _BookmateState();
}

class _BookmateState extends State<Bookmate> {
  @override
  Widget build(BuildContext context) {
    TextEditingController studentClassController = TextEditingController();
    TextEditingController studentSubjectController = TextEditingController();
    TextEditingController studentChapterNameController =
        TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: studentClassController,
                  decoration: const InputDecoration(
                    labelText: "Enter Your Class",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.class_),
                  ),
                  onTap: () {
                    Provider.of<BookMate>(context, listen: false)
                        .clearBackend();
                  },
                ),
              ),
              Expanded(
                child: TextField(
                  controller: studentSubjectController,
                  decoration: const InputDecoration(
                    labelText: "Enter Subject",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.book_rounded),
                  ),
                  onTap: () {
                    Provider.of<BookMate>(context, listen: false)
                        .clearBackend();
                  },
                ),
              ),
              Expanded(
                child: TextField(
                  controller: studentChapterNameController,
                  decoration: const InputDecoration(
                    labelText: "Enter Chapter Name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.bookmark_add_outlined),
                  ),
                  onTap: () {
                    Provider.of<BookMate>(context, listen: false)
                        .clearBackend();
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Text(
                  Provider.of<BookMate>(context, listen: false).getData(),
                  style: const TextStyle(
                    color: Colors.black,
                    backgroundColor: ELEVATED_BUTTON_COLOR,
                    fontSize: 24.0,
                  ),
                )),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    await Provider.of<BookMate>(context, listen: false)
                        .getQuestions(
                            studentClassController.text,
                            studentSubjectController.text,
                            studentChapterNameController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ELEVATED_BUTTON_COLOR,
                    textStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Get Questions"),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:autogpt/controller/bookmate/get_response_from_llm.dart';
import 'package:flutter/widgets.dart';

class BookmateModel {
  late String studentClass;
  late String studentSubject;
  late String studentChapterName;
  late String llmResponse;

  BookmateModel(
      {this.studentClass = "X",
      this.studentSubject = "Science",
      this.studentChapterName = "Chapter:2 Acid, Base and Salts",
      this.llmResponse = "Output Window"});
}

class BookMate with ChangeNotifier {
  BookmateModel bm = BookmateModel();
  Future<void> getQuestions(stClass, stSub, stChap) async {
    bm.studentClass = stClass;
    bm.studentSubject = stSub;
    bm.studentChapterName = stChap;

    var data = {
      "contents": [
        {
          "parts": [
            {
              'text': '''Urgent Exam Prep - Prioritize Key Questions
Task: Analyze CBSE Class ${bm.studentClass}, ${bm.studentSubject} Chapter ${bm.studentChapterName} (input from the student) question patterns from the past 10 years to create a "crash course" list of high-priority questions for students with only 2 days remaining before the exam.
Focus:
Repetition is Key: Questions asked multiple times across past papers take top priority.
Concept Coverage: Ensure the question list collectively covers the core concepts tested within the chapter.
Exam Day Format: Match the proportion of multiple-choice, short-answer, long-answer, and diagram-based questions typically seen on the exam.
"Must-Know" Definitions: Include questions directly asking for key definitions within the chapter.
Method:
Question Bank: Official CBSE website for released question papers (last 5 years): "https://www.cbse.gov.in/cbsenew/question-paper.html"
Frequency Analysis: Identify questions repeated 3 or more times. These automatically make the prioritized list.
Concept Gaps: Check the core concepts of Chapter [ChapterName]. If those directly match any questions, add those even if frequency is lower.
Balance Question Types: Aim to make the final output approximately match the percentage breakdown the CBSE exam usually has (e.g., 30% multiple choice, 40% short answers, etc.).
Output:
"Emergency Study List": A simple document with 8-15 questions that MUST be practiced. Indicate the question type and how many times it has appeared previously.
Concept Flashcards: Include a mini-deck of quick definitions or one-sentence explanations of core concepts likely to be tested.
Additional Enhancements:
Difficulty Indicator: If time allows, give questions a basic difficulty rating (Easy, Medium, Hard)
"Do Not Skip" Warnings: Highlight any definition or concept-based questions that seem non-negotiable to know before the exam.`
                }]
                }],
                "safetySettings": [
                    {
                        "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
                        "threshold": "BLOCK_ONLY_HIGH"
                    }
                ],
                "generationConfig": {
                    "stopSequences": [
                        "Title"
                    ],
                    "temperature": 0.6,
                    "maxOutputTokens": 800,
                    "topP": 0.8,
                    "topK": 10
                }
            };
'''
            }
          ]
        }
      ]
    };
    try {
      final response = await fetchData(data);
      bm.llmResponse = response["data"];
      print(bm.llmResponse);

      notifyListeners();
    } catch (error) {
      print("Some error occurred: $error");
    }
  }

  void clearBackend() {
    bm.llmResponse = "";
    notifyListeners();
  }

  String getData() {
    return bm.llmResponse;
  }
}

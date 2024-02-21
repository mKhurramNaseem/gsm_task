import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gsm_task/student_module/model/student.dart';

class StudentStatusPage extends StatefulWidget {
  static const pageName = 'studentstatus';
  const StudentStatusPage({super.key});

  @override
  State<StudentStatusPage> createState() => _StudentStatusPageState();
}

class _StudentStatusPageState extends State<StudentStatusPage> {
  String text = 'Your registration is pending';
  Student? student;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    student = ModalRoute.of(context)!.settings.arguments as Student;
    if (student != null) {
      FirebaseFirestore.instance
          .collection(Student.collectionName)
          .doc(
              student!.email.substring(0, student!.email.indexOf('@gmail.com')))
          .snapshots()
          .listen((event) {
        if (event.data() != null) {
          Student std = Student.fromMap(event.data()!);
          if (std.status == Student.statusApproved) {
            setState(() {
              text = 'Your request has been approved';
            });
          } else if (std.status == Student.statusDeclined) {
            setState(() {
              text = 'Your request has been declined';
            });
          } else {
            setState(() {
              text = 'Your request is pending';
            });
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),    
    );
  }
}

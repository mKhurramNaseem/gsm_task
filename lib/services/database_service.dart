import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gsm_task/student_module/model/registration_token.dart';
import 'package:gsm_task/student_module/model/student.dart';

class StudentDatabaseService{

  static StudentDatabaseService? _instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  StudentDatabaseService._internal();

  // Singleton Pattern to avoid redundant objects creation
  factory StudentDatabaseService(){
    return _instance ??= StudentDatabaseService._internal();
  }

  // Insert Student Into Firestore 
  insertStudent(Student student) async{
    String docKey = student.email.substring(0,student.email.indexOf('@gmail.com'));
    await firestore.collection(Student.collectionName).doc(docKey).set(student.toMap());
  }
  // Fetching students with pending status
  Future<List<Student>> fetchStudents([String pendingStatus = '']) async{
    QuerySnapshot<Map<String , dynamic>> snapshot;
    if(pendingStatus.isEmpty){
      snapshot = await firestore.collection(Student.collectionName).get();
    }else{
      snapshot = await firestore.collection(Student.collectionName).where(Student.keyStatus,isEqualTo: pendingStatus).get();
    }     
    return snapshot.docs.map((e) => Student.fromMap(e.data())).toList();
  }



  Future<List<RegistrationToken>> fetchAdminsRegistrationTokens()async{
    QuerySnapshot<Map<String , dynamic>> querySnapshot = await firestore.collection(RegistrationToken.adminTokensCollectionName).get();
    return querySnapshot.docs.map((e) => RegistrationToken.fromMap(e.data())).toList();
  }

  Future<RegistrationToken> fetchStudentsRegistrationTokens({required Student student})async{
    DocumentSnapshot<Map<String , dynamic>> querySnapshot = await firestore.collection(RegistrationToken.studentTokensCollectionName).doc(student.email.substring(0,student.email.indexOf('@gmail.com'))).get();
    return RegistrationToken.fromMap(querySnapshot.data()!);
  }

  uploadStudentTokenToServer(RegistrationToken token , String key)async{
    await firestore.collection(RegistrationToken.studentTokensCollectionName).doc(key).set(token.toMap());
  }

  uploadAdminTokenToServer(RegistrationToken token , String key)async{
    await firestore.collection(RegistrationToken.adminTokensCollectionName).doc(key).set(token.toMap());
  }


}
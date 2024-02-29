import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (error) {
      print('Failed to sign in with email and password: $error');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      print('Failed to sign out: $error');
    }
  }
}

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final CollectionReference issueCollection =
//       FirebaseFirestore.instance.collection('IssuesData');

//   Future<List<Map<String, dynamic>>> getIssues(issueCollection) async {
//     List<Map<String, dynamic>> issues = [];
//     try {
//       print("Fetching issues...");
//       QuerySnapshot querySnapshot = await issueCollection.get();
//       print("Fetched ${querySnapshot.docs.length} documents");
//       querySnapshot.docs.forEach((doc) {
//         Map<String, dynamic> issueData = doc.data() as Map<String, dynamic>;
//         issueData['id'] = doc.id; // Add document ID to the map
//         print("Adding issue: $issueData");
//         issues.add(issueData);
//       });
//       print("Returning ${issues.length} issues");
//       return issues;
//     } catch (e) {
//       print("Error fetching issues: $e");
//       return [];
//     }
//   }
// }

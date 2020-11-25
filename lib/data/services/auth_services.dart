import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yourhealth/data/models/appointment.dart';
import 'package:yourhealth/data/models/doctor.dart';
import 'package:yourhealth/data/models/message.dart';
import 'package:yourhealth/data/models/user.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final _google = GoogleSignIn();

  // Check auth state

  Stream<User> get user {
    return _auth.authStateChanges();
  }

  // Register new user

  Future signUpNewPatient(Map<String, dynamic> data) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: data['email'].toString(),
          password: data['password'].toString());
      User user = result.user;
      try {
        await user.sendEmailVerification();
      } catch (e) {
        print("An error occured while trying to send email verification");
        print(e.message);
      }
      print(user.uid);
      await _fireStore.collection('users').doc(user.uid).set(data);
      await _fireStore.collection('patients').doc(user.uid).set(data);

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUpNewDoctor(Map<String, dynamic> data) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: data['email'].toString(),
          password: data['password'].toString());
      User user = result.user;
      print(user.uid);
      try {
        await user.sendEmailVerification();
      } catch (e) {
        print("An error occured while trying to send email verification");
        print(e.message);
      }

      await _fireStore.collection('users').doc(user.uid).set(data);
      await _fireStore.collection('doctors').doc(user.uid).set(data);
      await _fireStore.collection('registeredDoctors').doc(user.uid).set(data);

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in
  Future signInUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      if (user.emailVerified) return user;
      print(user.uid);
      return null;
      //return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Admin Sign In
  Future signInadmin(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Google Sign In

  Future googleSignIn() async {
    GoogleSignInAccount account = await _google.signIn();
    if (account != null) {
      GoogleSignInAuthentication googleAuth = await account.authentication;
      GoogleAuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      UserCredential cred = await _auth.signInWithCredential(credential);
      User googleUser = cred.user;
      print('Google User: ${googleUser.uid}');
      return googleUser;
    }
    return null;
  }

  // Sign out

  Future signOutUser() async {
    User currentUser = _auth.currentUser;
    if (currentUser.providerData[0].providerId == 'google.com') {
      await _google.disconnect();
    }
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Reset Password

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  // Get list of doctors
  List<Doctor> _listDoctorsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Doctor(
          uid: doc.id,
          name: doc.data()['name'] ?? '',
          speciality: doc.data()['speciality'] ?? '',
          visitingHour: doc.data()['visitingHour'] ?? '',
          location: doc.data()['location'] ?? '');
    }).toList();
  }

  Stream<List<Doctor>> get doctors {
    return _fireStore
        .collection('doctors')
        .snapshots()
        .map((_listDoctorsFromSnapshot));
  }

  Stream<List<Doctor>> get newDoctors {
    return _fireStore
        .collection('registeredDoctors')
        .snapshots()
        .map((_listDoctorsFromSnapshot));
  }

  // Get list of patients

  List<UserModel> _listPatients(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserModel(
        uid: doc.id,
        name: doc.data()['name'] ?? '',
      );
    }).toList();
  }

  Stream<List<UserModel>> get patientList {
    return _fireStore.collection('patients').snapshots().map((_listPatients));
  }

  // Get list of appointments
  List<Appointment> _listAppointmentsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Appointment(
        patientName: doc.data()['patientName'] ?? '',
        doctorName: doc.data()['doctorName'] ?? '',
        date: doc.data()['date'] ?? '',
        time: doc.data()['time'] ?? '',
        message: doc.data()['message'] ?? '',
        appointmentId: doc.data()['appointmentId'] ?? '',
        patientId: doc.data()['patientId'] ?? '',
        doctorId: doc.data()['doctorId'] ?? '',
      );
    }).toList();
  }

  Stream<List<Appointment>> appointments(bool isPatient) {
    String uid = _auth.currentUser.uid;
    if (isPatient) {
      return _fireStore
          .collection('patients')
          .doc(uid)
          .collection('pendingAppointments')
          .snapshots()
          .map((_listAppointmentsFromSnapshot));
    }
    return _fireStore
        .collection('doctors')
        .doc(uid)
        .collection('pendingAppointments')
        .snapshots()
        .map((_listAppointmentsFromSnapshot));
  }

  Stream<List<Appointment>> acceptedAppointments(bool isPatient) {
    String uid = _auth.currentUser.uid;
    if (isPatient) {
      return _fireStore
          .collection('patients')
          .doc(uid)
          .collection('appointments')
          .snapshots()
          .map((_listAppointmentsFromSnapshot));
    }
    return _fireStore
        .collection('doctors')
        .doc(uid)
        .collection('appointments')
        .snapshots()
        .map((_listAppointmentsFromSnapshot));
  }


  // List of messages
  List<Message> _listMessagesFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      print(doc.data());
      return Message(
          body: doc.data()['body'],
          senderId: doc.data()['senderId'] ?? '',
          receiverId: doc.data()['recieverId'] ?? '',
          timeStamp: doc.data()['timeStamp']);
    }).toList();
  }

  Stream<List<Message>> getMessages(Doctor doctor) {
    return _fireStore
        .collection('users')
        .doc(_auth.currentUser.uid)
        .collection('conversations')
        .doc(doctor.uid)
        .collection('messages')
        .snapshots()
        .map((_listMessagesFromSnapshot));
  }

  // List Patients
  List<Future<UserModel>> _listPatientsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) async {
      DocumentSnapshot userData =
          await _fireStore.collection('users').doc(doc.id).get();
      return UserModel(
        uid: doc.id,
        name: userData.data()['name'] ?? '',
      );
    }).toList();
  }

  Stream<List<Future<UserModel>>> get patients {
    return _fireStore
        .collection('users')
        .doc(_auth.currentUser.uid)
        .collection('conversations')
        .snapshots()
        .map((_listPatientsFromSnapshot));
  }
}

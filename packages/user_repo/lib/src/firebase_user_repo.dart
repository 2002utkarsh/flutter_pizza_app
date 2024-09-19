import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_repo/src/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repo/src/models/users.dart';
import 'package:user_repo/user_repository.dart';



class FirebaseUserRepo implements UserRepo{
  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  // TODO: implement user
  Stream<dynamic> get user {
     return _firebaseAuth.authStateChanges().flatMap((firebaseUser) async*{
       if(firebaseUser == null){
        yield MyUser.empty;
       }
       yield usersCollection
       .doc(firebaseUser.uid)
       .get()
       .then((value) => MyUser.fromEntity(MyUserEntity.fromDocument(value.data()!)));
     })
  }

  @override
  Future<void> setUserData(user) {
    // TODO: implement setUserData
    throw UnimplementedError();
  }
  
  @override
  Future<dynamic> signUp(myUser, String pass) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
  
  @override
  Future<void> signIn(String email, String pass) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
  
  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }
  
}


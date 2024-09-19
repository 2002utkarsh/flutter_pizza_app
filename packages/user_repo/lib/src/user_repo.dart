

abstract class UserRepo {
  Stream<MyUser> get user;

  Future<MyUser> signUp(MyUser myUser, String pass);

  Future<void> setUserData (MyUser user);

  Future<void> signIn(String email, String pass);

  Future<void> logOut();
}
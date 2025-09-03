class AuthResponseEntity {
  AuthResponseEntity({
      this.message, 
      this.user,
    this.token,
    this.statusMsg
     });

  String? message;
  UserEntity? user;
  String?statusMsg;
  String?token;



}

class UserEntity {
  UserEntity({
      this.name, 
      this.email, 
     });


  String? name;
  String? email;




}
class Accounts {
  final String id;
  final String phone;
  final String password;
  final String salt;
  final String username;

  Accounts(this.id, this.phone, this.password, this.salt, this.username);

  getName() {
    return username;
  }
}
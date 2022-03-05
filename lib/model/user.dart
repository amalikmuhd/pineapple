class Users {
  final String uid;
  final String? displayName;
  final String? email;
  final bool? emailVerified;
  final bool? isAnonymous;
  final String? phoneNumber;
  final String? photoURL;
  final String? refreshToken;

  Users(
      {required this.uid,
      this.displayName,
      this.email,
      this.emailVerified,
      this.isAnonymous,
      this.phoneNumber,
      this.photoURL,
      this.refreshToken});

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'displayName': displayName,
        'email': email,
        'emailVerified': emailVerified,
        'isAnonymous': isAnonymous,
        'phoneNumber': phoneNumber,
        'photoURL': photoURL,
        'refreshToken': refreshToken
      };
}

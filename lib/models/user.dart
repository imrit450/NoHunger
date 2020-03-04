class User {
  final String uid;

  User({this.uid});
}

class DonorUserData {
  final String uid;
  final String name;
  final String contact_no;
  final String email;
  final String address;

  DonorUserData(
      {this.uid, this.name, this.contact_no, this.email, this.address});
}

class OrganisationUserData {
  final String uid;
  final String name;
  final String contact_no;
  final String email;
  final String address;
  final String brn_no;
  final String dietary_rules;
  final String dates_accept;
  final String category;

  OrganisationUserData(
      {this.uid,
      this.name,
      this.contact_no,
      this.email,
      this.address,
      this.brn_no,
      this.dietary_rules,
      this.dates_accept,
      this.category});
}

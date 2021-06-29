part of model;

@JsonSerializable()
class User {
  @JsonKey(required: true, disallowNullValue: true)
  final String id;

  @JsonKey(required: true, disallowNullValue: true)
  final String emailAddress;

  @JsonKey(includeIfNull: true)
  final String firstName;

  @JsonKey(includeIfNull: true)
  final String lastName;

  String get fullName => '$firstName $lastName'.trim();

  User(this.id, this.emailAddress, this.firstName, this.lastName);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

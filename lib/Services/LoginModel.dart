class LoginResponse {
  ContactPerson? contactperson;
  Address? address;
  BusInfo? businessInformation;
  TraficDet? tariffDetails;
  List<String>? role;
  String? status;
  List? announcements;
  List? locations;
  List? coupinos;
  bool? needsDefaultCoupino;
  int? coupinoLimit;
  bool? needsApproval;
  String? id;
  String? email;
  String? date;
  bool? isActive;
  bool? isEmailVerified;
  bool? isRegistrationComplete;
  int? v;
  String? emailVerifiedDate;
  String? loginTimestamp;
  String? loginToken;
  List? banHistory;
  Null? markedForDeletion;

  LoginResponse({this.contactperson,
    this.address,
    this.businessInformation,
    this.tariffDetails,
    this.role,
    this.status,
    this.announcements,
    this.locations,
    this.coupinos,
    this.needsDefaultCoupino,
    this.coupinoLimit,
    this.needsApproval,
    this.id,
    this.email,
    this.date,
    this.isActive,
    this.isEmailVerified,
    this.isRegistrationComplete,
    this.v,
    this.emailVerifiedDate,
    this.loginTimestamp,
    this.loginToken,
    this.banHistory,
    this.markedForDeletion});

  LoginResponse.fromJson(Map<String, dynamic> json){
    contactperson = json['contactPerson'] != null ? ContactPerson.fromJson(
        json['contactPerson']) : null;
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    businessInformation =
    json['businessInformation'] != null ? BusInfo.fromJson(
        json['businessInformation']) : null;
    tariffDetails = json['tariffDetails'] != null
        ? TraficDet.fromJson(json['tariffDetails'])
        : null;
    role = json['role'].cast<String>();
    status = json['status'];
    announcements = (json['announcements'] as List?)?.toList() ?? [];
    locations =
        (json['locations'] as List?)?.toList() ?? [];
    coupinos =
        (json['coupinos'] as List?)?.toList() ?? [];
    needsDefaultCoupino = json['needsDefaultCoupino'];
    coupinoLimit = json['coupinoLimit'];
    needsApproval = json['needsApproval'];
    id = json['id'];
    email = json['email'];
    date = json['creationDate'];
    isActive = json['isActive'];
    isEmailVerified = json['isEmailVerified'];
    isRegistrationComplete = json['isRegistrationComplete'];
    v = json['__v'];
    emailVerifiedDate = json['emailVerifiedDate'];
    loginTimestamp = json['loginTimestamp'];
    loginToken = json['loginToken'];
    banHistory = json['banHistory'] ?? [];
    markedForDeletion = json['markedForDeletion'];
  }
}

class ContactPerson {
  String? defaultImagePath;
  bool? isDefaultImage;
  String? title;
  String? academicTitle;
  String? firstname;
  String? lastname;
  String? email;
  String? phonenumber;
  String? dob;
  String? gender;
  String? profilepic;


  ContactPerson({
    this.defaultImagePath,
    this.isDefaultImage,
    this.title,
    this.academicTitle,
    this.firstname,
    this.lastname,
    this.email,
    this.phonenumber,
    this.dob,
    this.gender,
    this.profilepic});

  ContactPerson.fromJson(Map<String, dynamic> json){
    defaultImagePath = json['defaultImagePath'];
    isDefaultImage = json ['isDefaultImage'];
    title = json['title'] ?? "";
    academicTitle = json['academicTitle'];
    firstname = json['firstName'];
    lastname = json['lastName'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    dob = json['dob'];
    gender = json['gender'];
    profilepic = json['profilePic'];
  }
}

class Address {
  String? street;
  String? streetnumber;
  String? postalcode;
  String? city;
  String? country;
  String? addressValidationCode;
  bool? isAddressValidated;
  String? resendValidationCodeRestrictionUpto;
  bool? isAddressCodeResent;
  int? wrongAttemptCount;
  String? wrongCodeBlockedUpto;
  String? lastUpdatedOn;

  Address({this.street,
    this.streetnumber,
    this.postalcode,
    this.city,
    this.country,
    this.addressValidationCode,
    this.isAddressValidated,
    this.resendValidationCodeRestrictionUpto,
    this.isAddressCodeResent,
    this.wrongAttemptCount,
    this.wrongCodeBlockedUpto,
    this.lastUpdatedOn});

  Address.fromJson(Map<String, dynamic> json){
    street = json['street'];
    streetnumber = json['streetNumber'];
    postalcode = json['postalCode'];
    city = json['city'];
    country = json['country'];
    addressValidationCode = json['addressValidationCode'];
    isAddressValidated = json['isAddressValidated'];
    resendValidationCodeRestrictionUpto = json['resendValidationCodeRestrictionUpto'];
    isAddressCodeResent = json['isAddressCodeResent'];
    wrongAttemptCount = json['wrongAttemptCount'];
    wrongCodeBlockedUpto = json['wrongCodeBlockedUpto'];
    lastUpdatedOn = json['lastUpdatedOn'];
  }
}

class BusInfo {
  String? name;
  String? UStID;
  String? registrationNumber;

  BusInfo({
    this.name,
    this.UStID,
    this.registrationNumber});

  BusInfo.fromJson(Map<String, dynamic> json){
    name = json['name'];
    UStID = json['UStId'];
    registrationNumber = json['registrationNumber'];
  }
}

class TraficDet {
  String? startdate;
  int? duration;
  int? maxCoupinoCount;
  int? maxLocationCount;

  TraficDet({
    this.startdate,
    this.duration,
    this.maxCoupinoCount,
    this.maxLocationCount});

  TraficDet.fromJson(Map<String, dynamic> json){
    startdate = json['startDate'];
    duration = json['duration'];
    maxCoupinoCount = json['maxCoupinoCount'];
    maxLocationCount = json['maxLocationCount'];
  }
}

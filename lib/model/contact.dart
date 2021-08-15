class Contacts {
  final String serviceTitle;
  final String text;
  final String imageUrl;
  final String contactDetail;

  Contacts(this.serviceTitle, this.text, this.imageUrl, this.contactDetail);
}

final List<Contacts> dummyContactList = [
  Contacts('Career Consultant', 'Alistair Adam', null, '9898'),
  Contacts('Career Service', 'Marisha Bakshi', null, '9898'),
  Contacts('Student Care', 'Jillian O\'Donovan', null, '9898'),
  Contacts('Finance', 'Laura Wooley', null, '9898'),
];
